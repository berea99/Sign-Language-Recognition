import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart';

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
        Image? imageToPredict = decodeImage(plane.bytes);
        imageToPredict = copyResize(imageToPredict!,
            width: 200, height: 200, interpolation: Interpolation.average);
        return grayscaleToByteListFloat32(imageToPredict, 200);
      }).toList(),
      imageHeight: 200,
      imageWidth: 200,
      imageMean: 0,
      imageStd: 255,
      threshold: 0.1,
    );

    emit(RealTimeState.predictionLoaded(cameraImage,
        recognitionsList: recognitionsList));
  }

  Uint8List concatenatePlanes(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();
    planes.forEach((Plane plane) => allBytes.putUint8List(plane.bytes));
    return allBytes.done().buffer.asUint8List();
  }

  Uint8List grayscaleToByteListFloat32(Image image, int inputSize) {
    var convertedBytes = Float32List(3 * inputSize * inputSize);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (getRed(pixel) / 255);
        buffer[pixelIndex++] = (getGreen(pixel) / 255);
        buffer[pixelIndex++] = (getBlue(pixel) / 255);
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  void loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model/model_complete.tflite',
        labels: 'assets/model/labels.txt');
  }
}
