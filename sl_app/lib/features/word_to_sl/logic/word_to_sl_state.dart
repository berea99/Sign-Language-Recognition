part of 'word_to_sl_cubit.dart';

@freezed
abstract class WordToSlState with _$WordToSlState {
  const factory WordToSlState.initial() = WordToSlInitial;
  const factory WordToSlState.loaded() = WordToSlLoaded;
  const factory WordToSlState.wordloaded(String word, String letter, int i) =
      WordToSlWordLoaded;
  const factory WordToSlState.error({String? error, int? code}) = WordToSlError;
}
