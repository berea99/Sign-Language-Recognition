import 'dart:io';

import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

part 'word_to_sl_state.dart';
part 'word_to_sl_cubit.freezed.dart';

class WordToSlCubit extends Cubit<WordToSlState> {
  WordToSlCubit() : super(const WordToSlState.initial());

  List<String> list = [];
  String? oldWord;

  void initialize() {
    emit(WordToSlState.loaded());
  }

  void toSL(String word) {
    oldWord = word;
    for (var i = 0; i < word.length; i++) {
      list.add(word[i].toUpperCase());
    }
    emit(WordToSlState.wordloaded(word, list[0], 99));
  }

  void play() async {
    var i = 0;
    for (var image in list) {
      await Future.delayed(Duration(seconds: 3), () {
        emit(WordToSlState.wordloaded(oldWord ?? '', image, i));
      });
      i++;
    }
    list = [];
  }
}
