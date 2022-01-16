part of 'gallery_cubit.dart';

@freezed
abstract class GalleryState with _$GalleryState {
  const factory GalleryState.initial() = GalleryInitial;
  const factory GalleryState.loading() = GalleryLoading;
  const factory GalleryState.loadingPrediction(File image) =
      GalleryLoadingPrediction;
  const factory GalleryState.predictionLoaded(File image,
      {List<dynamic>? output}) = GalleryPredictionLoaded;
  const factory GalleryState.error({String? error, int? code}) = GalleryError;
}
