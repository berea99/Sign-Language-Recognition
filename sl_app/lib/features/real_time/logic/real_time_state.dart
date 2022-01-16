part of 'real_time_cubit.dart';

@freezed
abstract class RealTimeState with _$RealTimeState {
  const factory RealTimeState.initial() = RealTimeInitial;
  const factory RealTimeState.loading() = RealTimeLoading;
  const factory RealTimeState.loaded() = RealTimeLoaded;
  const factory RealTimeState.loadingPrediction(CameraImage image) =
      RealTimeLoadingPrediction;
  const factory RealTimeState.predictionLoaded(CameraImage image,
      {List<dynamic>? recognitionsList}) = RealTimePredictionLoaded;
  const factory RealTimeState.error({String? error, int? code}) = RealTimeError;
}
