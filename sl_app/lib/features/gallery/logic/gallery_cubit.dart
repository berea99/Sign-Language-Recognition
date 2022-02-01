import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    var output = await Tflite.runModelOnImage(
      path: image.path,
    );
    print(output);
    emit(GalleryState.predictionLoaded(image, output: output));
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
