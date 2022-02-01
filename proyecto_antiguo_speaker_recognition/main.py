'''
This is the main code of the ECAPATDNN project, to define the parameters and build the construction
'''

import argparse, glob, os, torch, warnings, time
from tools import *
from dataLoader import train_loader
from SpeakerVerificationNet import SpeakerVerificationNet

parser = argparse.ArgumentParser(description = "ECAPA_trainer")

## Paths for train and eval
parser.add_argument('--train_path', type=str,   default="data/VoxCeleb2/train/wav",                    help='Training data path')
parser.add_argument('--eval_path',  type=str,   default="data/VoxCeleb1/test",                    help='Evaluation data path')
parser.add_argument('--musan_path', type=str,   default="data/Others/musan_split",                    help='MUSAN set path')
parser.add_argument('--rir_path',   type=str,   default="data/Others/RIRS_NOISES/simulated_rirs",     help='RIR set path');
parser.add_argument('--save_path',  type=str,   default="scores",                                     help='Scores path')
parser.add_argument('--initial_model',  type=str,   default="",                                          help='Initial model path')

## Lists
parser.add_argument('--eval_list',  type=str,   default="data/test_list.txt",              help='Evaluation list .txt')
parser.add_argument('--train_list', type=str,   default="data/train_list.txt",     help='Taining list .txt')

## Setting for the net train
parser.add_argument('--num_frames', type=int,   default=200,     help='Duration of the input segments')
parser.add_argument('--max_epoch',  type=int,   default=10,      help='Maximum number of epochs')
parser.add_argument('--batch_size', type=int,   default=300,     help='Batch size')
parser.add_argument('--n_cpu',      type=int,   default=4,       help='Number of loader threads')
parser.add_argument('--test_step',  type=int,   default=1,       help='Test and save every [test_step] epochs')
parser.add_argument('--lr',         type=float, default=0.001,   help='Learning rate')
parser.add_argument("--lr_decay",   type=float, default=0.95,    help='Learning rate decay every [test_step] epochs')

## Loss settings
parser.add_argument('--channel_size',       type=int,   default=1024,   help='Channel size for the speaker encoder')
parser.add_argument('--margin',       type=float, default=0.2,    help='Aam softmax loss margin')
parser.add_argument('--scale',       type=float, default=30,     help='Aam softmax loss')
parser.add_argument('--n_class', type=int,   default=5994,   help='Number of speakers in dataset')

## Eval command
parser.add_argument('--eval',    dest='eval', action='store_true', help='Do the evaluation only')

## Initialization
warnings.simplefilter("ignore")
torch.multiprocessing.set_sharing_strategy('file_system')
args = parser.parse_args()
args = init_args(args)




    
def main_worker(gpu, ngpus_per_node, args):
    
    trainloader = train_loader(**vars(args))
    trainLoader = torch.utils.data.DataLoader(trainloader, batch_size = args.batch_size, shuffle = True, num_workers = args.n_cpu, drop_last = True)

    
    modelfiles = glob.glob('%s/model_0*.model'%args.model_save_path)
    modelfiles.sort()

    
    if args.eval == True:
    	s = SpeakerVerificationNet(**vars(args))
    	print("Model %s loaded from previous state!"%args.initial_model)
    	s.load_parameters(args.initial_model)
    	EER, minDCF = s.eval_network(eval_list = args.eval_list, eval_path = args.eval_path)
    	print("EER %2.2f%%, minDCF %.4f%%"%(EER, minDCF))
    	quit()

    
    if args.initial_model != "":
    	print("Model %s loaded from previous state!"%args.initial_model)
    	s = SpeakerVerificationNet(**vars(args))
    	s.load_parameters(args.initial_model)
    	it = 1

    
    elif len(modelfiles) >= 1:
    	print("Model %s loaded from previous state!"%modelfiles[-1])
    	it = int(os.path.splitext(os.path.basename(modelfiles[-1]))[0][5:]) + 1
    	s = ECAPAModel(**vars(args))
    	s.load_parameters(modelfiles[-1])
    
    else:
    	epoch = 1
    	s = ECAPAModel(**vars(args))

    EERs = []
    score_file = open(args.score_save_path, "a+")
    
    for it in range(it,args.max_epochs+1):
    	
    	loss, lr, acc = s.train_network(epoch = epoch, loader = trainLoader)

    	
    	if epoch % args.test_step == 0:
    		s.save_parameters(args.model_save_path + "/model_%04d.model"%epoch)
    		EERs.append(s.eval_network(eval_list = args.eval_list, eval_path = args.eval_path)[0])
    		print(time.strftime("%Y-%m-%d %H:%M:%S"), "%d epoch, ACC %2.2f%%, EER %2.2f%%, bestEER %2.2f%%"%(epoch, acc, EERs[-1], min(EERs)))
    		score_file.write("%d epoch, LR %f, LOSS %f, ACC %2.2f%%, EER %2.2f%%, bestEER %2.2f%%\n"%(epoch, lr, loss, acc, EERs[-1], min(EERs)))
    		score_file.flush()

    
    
    
def main():

    if ("nsml" in sys.modules) and not args.eval:
        args.save_path  = os.path.join(args.save_path,SESSION_NAME.replace('/','_'))

    args.model_save_path     = args.save_path+"/model"
    args.result_save_path    = args.save_path+"/result"
    args.feat_save_path      = ""

    os.makedirs(args.model_save_path, exist_ok=True)
    os.makedirs(args.result_save_path, exist_ok=True)

    n_gpus = torch.cuda.device_count()

    print('Python Version:', sys.version)
    print('PyTorch Version:', torch.__version__)
    print('Number of GPUs:', torch.cuda.device_count())
    print('Save path:',args.save_path)

    
    mp.spawn(main_worker, nprocs=n_gpus, args=(n_gpus, args))
    
if __name__ == '__main__':
    main()

