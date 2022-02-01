# -*- coding: utf-8 -*-
import cv2
import numpy as np

#==================== CONSTANTES ================================================

classes = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
dim = (200,200)
a=np.zeros(156816, 36,53806, dtype='uint8')
a.nbytes
num = 0

#=================== CREAR LAS CARPETAS FINALES DE TRAIN Y TEST ==================

for i in range(5):
    for item in range(3000):
        for bg in range(6):
            if (bg==5 or (num>=42 and num<=47)):
                if bg == 0:
                    image = cv2.imread('new_data/asl_alphabet_train/' + classes[i] + '/'+classes[i] + str(item+1) +'.jpg',cv2.IMREAD_COLOR)
                else:
                    image = cv2.imread('new_data/asl_alphabet_train/' + classes[i] + '/'+classes[i] + str(item+1) +'_'+str(bg)+'.jpg',cv2.IMREAD_COLOR)
            
                print('final_data/test/' + classes[i] + '/'+classes[i] + str(item+1) +'_'+str(bg)+'.jpg')
                cv2.imwrite('final_data/test/'+ classes[i] +'/'+ classes[i] + str(item+1)+'_'+str(bg)+'.jpg', image)
            
                if num == 47:
                    num = 0
                else:
                    num = num + 1
            else:
                if bg == 0:
                    image = cv2.imread('new_data/asl_alphabet_train/' + classes[i] + '/'+classes[i] + str(item+1) +'.jpg',cv2.IMREAD_COLOR)
                else:
                    image = cv2.imread('new_data/asl_alphabet_train/' + classes[i] + '/'+classes[i] + str(item+1) +'_'+str(bg)+'.jpg',cv2.IMREAD_COLOR)    
                
                print('new_data/asl_alphabet_train/' + classes[i] + '/'+classes[i] + str(item+1) +'_'+str(bg)+'.jpg')
                cv2.imwrite('final_data/train/'+ classes[i] +'/'+ classes[i] + str(item+1)+'_'+str(bg)+'.jpg', image)
                
                num = num + 1

#================= DATA AUGMENTATION =============================================

for x in range(5):
    background = cv2.imread('galeria/BG'+str(x+1)+'.jpg')
    bg_resized = cv2.resize(background, dim)
    for i in range(len(classes)):
        for item in range(3000):
            frame = cv2.imread('data/asl_alphabet_train/' + classes[i] + '/'+classes[i] + str(item+1) +'.jpg',cv2.IMREAD_COLOR)
            roi = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
            roi = cv2.GaussianBlur(roi,(17,17),0)
            et,mask = cv2.threshold(roi,127,255,cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU)
            mask2 = np.where((mask<200),0,1).astype('uint8')
            mask3 = np.where((mask>200),0,1).astype('uint8')
            img = frame*mask2[:,:,np.newaxis]
            img2 = bg_resized*mask3[:,:,np.newaxis]
            dst = cv2.addWeighted(img2,1.0, img, 1.0, 0.0)
            cv2.imwrite('new_data/asl_alphabet_train/'+ classes[i] +'/'+ classes[i] + str(item+1)+'_'+str(x+1)+'.jpg', dst)
            if(item==0):
                print(classes[i])
