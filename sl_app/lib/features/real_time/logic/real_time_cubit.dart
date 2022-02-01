import 'dart:io';

import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

part 'real_time_state.dart';
part 'real_time_cubit.freezed.dart';

class RealTimeCubit extends Cubit<RealTimeState> {
  RealTimeCubit() : super(const RealTimeState.initial());

  final ImagePicker picker = ImagePicker();

  void initialize() {}

  Future<List<CameraDescription>> loadCameras() async {
    List<CameraDescription> cameras = await availableCameras();
    return cameras;
  }

  void classifyImage(CameraImage cameraImage) async {
    emit(RealTimeState.loadingPrediction(cameraImage));
    var recognitionsList = await Tflite.runModelOnFrame(
      bytesList: cameraImage.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: cameraImage.height,
      imageWidth: cameraImage.width,
      imageMean: 127.5,
      imageStd: 127.5,
      threshold: 0.1,
    );

    emit(RealTimeState.predictionLoaded(cameraImage,
        recognitionsList: recognitionsList));
  }

  void loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model/model_complete.tflite',
        labels: 'assets/model/labels.txt');
  }
}
