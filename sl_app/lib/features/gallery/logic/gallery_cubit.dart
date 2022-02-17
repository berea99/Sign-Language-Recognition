import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

part 'gallery_state.dart';
part 'gallery_cubit.freezed.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(const GalleryState.initial());

  final ImagePicker picker = ImagePicker();

  void initialize() {}

  void classifyImage(File image) async {
    emit(GalleryState.loadingPrediction(image));

    Uint8List data = image.readAsBytesSync();
    Image? imageToPredict = decodeImage(data);
    imageToPredict = copyResize(imageToPredict!,
        width: 200, height: 200, interpolation: Interpolation.average);
    var output = await Tflite.runModelOnBinary(
      binary: grayscaleToByteListFloat32(imageToPredict, 200),
      numResults: 10,
      threshold: 0.5,
      asynch: false,
    );
    print('OUTPUUUUUUUUUUUUUUUT');
    print(output);
    emit(GalleryState.predictionLoaded(image, output: output));
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

  void pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    classifyImage(File(image.path));
  }

  void pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    classifyImage(File(image.path));
  }
}
