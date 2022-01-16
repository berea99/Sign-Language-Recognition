import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sl_app/core/ui-components/theme/colors.dart';
import 'package:tflite/tflite.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sl_app/features/real_time/logic/real_time_cubit.dart';
import 'package:tflite/tflite.dart';

class RealTimeScreenWithCubit extends StatelessWidget {
  const RealTimeScreenWithCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RealTimeCubit()..initialize(),
      child: const RealTimeScreen(),
    );
  }
}

class RealTimeScreen extends StatefulWidget {
  const RealTimeScreen({Key? key}) : super(key: key);

  @override
  _RealTimeScreenState createState() => _RealTimeScreenState();
}

class _RealTimeScreenState extends State<RealTimeScreen> {
  CameraController? cameraController;
  CameraImage? cameraImage;

  @override
  void initState() {
    super.initState();
    context.read<RealTimeCubit>().loadModel();
    initCamera();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cameraController?.stopImageStream();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Language App'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: BlocConsumer<RealTimeCubit, RealTimeState>(
        listener: (context, state) async {},
        builder: (context, state) {
          return state.when(
              initial: () => loadedUI(false),
              loading: () => loadedUI(true),
              loaded: () => loadedUI(false),
              loadingPrediction: (image) => loadedUI(true, cameraImage: image),
              predictionLoaded: (image, list) =>
                  loadedUI(false, cameraImage: image, recognitionsList: list),
              error: (error, code) => loadedUI(false));
        },
      ),
    );
  }

  Widget loadedUI(bool loading,
      {CameraImage? cameraImage, List? recognitionsList}) {
    Size size = MediaQuery.of(context).size;
    List<Widget> list = [];

    list.add(
      Positioned(
        top: 0.0,
        left: 0.0,
        width: size.width,
        height: size.height - 100,
        child: Container(
          height: size.height - 100,
          child: (!cameraController!.value.isInitialized)
              ? new Container()
              : AspectRatio(
                  aspectRatio: cameraController!.value.aspectRatio,
                  child: CameraPreview(cameraController!),
                ),
        ),
      ),
    );

    if (cameraImage != null) {
      list.addAll(displayBoxesAroundRecognizedObjects(size, recognitionsList));
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.only(top: 50),
          color: Colors.black,
          child: Stack(
            children: list,
          ),
        ),
      ),
    );
  }

  void initCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      setState(() {
        cameraController!.startImageStream((image) => {
              cameraImage = image,
              context.read<RealTimeCubit>().classifyImage(image),
            });
      });
    });
  }

  List<Widget> displayBoxesAroundRecognizedObjects(
      Size screen, List? recognitionsList) {
    if (recognitionsList == null) return [];

    double factorX = screen.width;
    double factorY = screen.height;

    Color colorPick = Colors.pink;

    return recognitionsList.map((result) {
      return Positioned(
        left: result["rect"]["x"] * factorX,
        top: result["rect"]["y"] * factorY,
        width: result["rect"]["w"] * factorX,
        height: result["rect"]["h"] * factorY,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.pink, width: 2.0),
          ),
          child: Text(
            "${result['detectedClass']} ${(result['confidenceInClass'] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = colorPick,
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      );
    }).toList();
  }
}
