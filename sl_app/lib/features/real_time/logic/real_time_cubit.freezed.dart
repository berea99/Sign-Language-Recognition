// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'real_time_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RealTimeStateTearOff {
  const _$RealTimeStateTearOff();

  RealTimeInitial initial() {
    return const RealTimeInitial();
  }

  RealTimeLoading loading() {
    return const RealTimeLoading();
  }

  RealTimeLoaded loaded() {
    return const RealTimeLoaded();
  }

  RealTimeLoadingPrediction loadingPrediction(CameraImage image) {
    return RealTimeLoadingPrediction(
      image,
    );
  }

  RealTimePredictionLoaded predictionLoaded(CameraImage image,
      {List<dynamic>? recognitionsList}) {
    return RealTimePredictionLoaded(
      image,
      recognitionsList: recognitionsList,
    );
  }

  RealTimeError error({String? error, int? code}) {
    return RealTimeError(
      error: error,
      code: code,
    );
  }
}

/// @nodoc
const $RealTimeState = _$RealTimeStateTearOff();

/// @nodoc
mixin _$RealTimeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(CameraImage image) loadingPrediction,
    required TResult Function(
            CameraImage image, List<dynamic>? recognitionsList)
        predictionLoaded,
    required TResult Function(String? error, int? code) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(CameraImage image)? loadingPrediction,
    TResult Function(CameraImage image, List<dynamic>? recognitionsList)?
        predictionLoaded,
    TResult Function(String? error, int? code)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealTimeInitial value) initial,
    required TResult Function(RealTimeLoading value) loading,
    required TResult Function(RealTimeLoaded value) loaded,
    required TResult Function(RealTimeLoadingPrediction value)
        loadingPrediction,
    required TResult Function(RealTimePredictionLoaded value) predictionLoaded,
    required TResult Function(RealTimeError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealTimeInitial value)? initial,
    TResult Function(RealTimeLoading value)? loading,
    TResult Function(RealTimeLoaded value)? loaded,
    TResult Function(RealTimeLoadingPrediction value)? loadingPrediction,
    TResult Function(RealTimePredictionLoaded value)? predictionLoaded,
    TResult Function(RealTimeError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealTimeStateCopyWith<$Res> {
  factory $RealTimeStateCopyWith(
          RealTimeState value, $Res Function(RealTimeState) then) =
      _$RealTimeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RealTimeStateCopyWithImpl<$Res>
    implements $RealTimeStateCopyWith<$Res> {
  _$RealTimeStateCopyWithImpl(this._value, this._then);

  final RealTimeState _value;
  // ignore: unused_field
  final $Res Function(RealTimeState) _then;
}

/// @nodoc
abstract class $RealTimeInitialCopyWith<$Res> {
  factory $RealTimeInitialCopyWith(
          RealTimeInitial value, $Res Function(RealTimeInitial) then) =
      _$RealTimeInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$RealTimeInitialCopyWithImpl<$Res>
    extends _$RealTimeStateCopyWithImpl<$Res>
    implements $RealTimeInitialCopyWith<$Res> {
  _$RealTimeInitialCopyWithImpl(
      RealTimeInitial _value, $Res Function(RealTimeInitial) _then)
      : super(_value, (v) => _then(v as RealTimeInitial));

  @override
  RealTimeInitial get _value => super._value as RealTimeInitial;
}

/// @nodoc
class _$RealTimeInitial implements RealTimeInitial {
  const _$RealTimeInitial();

  @override
  String toString() {
    return 'RealTimeState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RealTimeInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(CameraImage image) loadingPrediction,
    required TResult Function(
            CameraImage image, List<dynamic>? recognitionsList)
        predictionLoaded,
    required TResult Function(String? error, int? code) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(CameraImage image)? loadingPrediction,
    TResult Function(CameraImage image, List<dynamic>? recognitionsList)?
        predictionLoaded,
    TResult Function(String? error, int? code)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealTimeInitial value) initial,
    required TResult Function(RealTimeLoading value) loading,
    required TResult Function(RealTimeLoaded value) loaded,
    required TResult Function(RealTimeLoadingPrediction value)
        loadingPrediction,
    required TResult Function(RealTimePredictionLoaded value) predictionLoaded,
    required TResult Function(RealTimeError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealTimeInitial value)? initial,
    TResult Function(RealTimeLoading value)? loading,
    TResult Function(RealTimeLoaded value)? loaded,
    TResult Function(RealTimeLoadingPrediction value)? loadingPrediction,
    TResult Function(RealTimePredictionLoaded value)? predictionLoaded,
    TResult Function(RealTimeError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RealTimeInitial implements RealTimeState {
  const factory RealTimeInitial() = _$RealTimeInitial;
}

/// @nodoc
abstract class $RealTimeLoadingCopyWith<$Res> {
  factory $RealTimeLoadingCopyWith(
          RealTimeLoading value, $Res Function(RealTimeLoading) then) =
      _$RealTimeLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$RealTimeLoadingCopyWithImpl<$Res>
    extends _$RealTimeStateCopyWithImpl<$Res>
    implements $RealTimeLoadingCopyWith<$Res> {
  _$RealTimeLoadingCopyWithImpl(
      RealTimeLoading _value, $Res Function(RealTimeLoading) _then)
      : super(_value, (v) => _then(v as RealTimeLoading));

  @override
  RealTimeLoading get _value => super._value as RealTimeLoading;
}

/// @nodoc
class _$RealTimeLoading implements RealTimeLoading {
  const _$RealTimeLoading();

  @override
  String toString() {
    return 'RealTimeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RealTimeLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(CameraImage image) loadingPrediction,
    required TResult Function(
            CameraImage image, List<dynamic>? recognitionsList)
        predictionLoaded,
    required TResult Function(String? error, int? code) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(CameraImage image)? loadingPrediction,
    TResult Function(CameraImage image, List<dynamic>? recognitionsList)?
        predictionLoaded,
    TResult Function(String? error, int? code)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealTimeInitial value) initial,
    required TResult Function(RealTimeLoading value) loading,
    required TResult Function(RealTimeLoaded value) loaded,
    required TResult Function(RealTimeLoadingPrediction value)
        loadingPrediction,
    required TResult Function(RealTimePredictionLoaded value) predictionLoaded,
    required TResult Function(RealTimeError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealTimeInitial value)? initial,
    TResult Function(RealTimeLoading value)? loading,
    TResult Function(RealTimeLoaded value)? loaded,
    TResult Function(RealTimeLoadingPrediction value)? loadingPrediction,
    TResult Function(RealTimePredictionLoaded value)? predictionLoaded,
    TResult Function(RealTimeError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RealTimeLoading implements RealTimeState {
  const factory RealTimeLoading() = _$RealTimeLoading;
}

/// @nodoc
abstract class $RealTimeLoadedCopyWith<$Res> {
  factory $RealTimeLoadedCopyWith(
          RealTimeLoaded value, $Res Function(RealTimeLoaded) then) =
      _$RealTimeLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RealTimeLoadedCopyWithImpl<$Res>
    extends _$RealTimeStateCopyWithImpl<$Res>
    implements $RealTimeLoadedCopyWith<$Res> {
  _$RealTimeLoadedCopyWithImpl(
      RealTimeLoaded _value, $Res Function(RealTimeLoaded) _then)
      : super(_value, (v) => _then(v as RealTimeLoaded));

  @override
  RealTimeLoaded get _value => super._value as RealTimeLoaded;
}

/// @nodoc
class _$RealTimeLoaded implements RealTimeLoaded {
  const _$RealTimeLoaded();

  @override
  String toString() {
    return 'RealTimeState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RealTimeLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(CameraImage image) loadingPrediction,
    required TResult Function(
            CameraImage image, List<dynamic>? recognitionsList)
        predictionLoaded,
    required TResult Function(String? error, int? code) error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(CameraImage image)? loadingPrediction,
    TResult Function(CameraImage image, List<dynamic>? recognitionsList)?
        predictionLoaded,
    TResult Function(String? error, int? code)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealTimeInitial value) initial,
    required TResult Function(RealTimeLoading value) loading,
    required TResult Function(RealTimeLoaded value) loaded,
    required TResult Function(RealTimeLoadingPrediction value)
        loadingPrediction,
    required TResult Function(RealTimePredictionLoaded value) predictionLoaded,
    required TResult Function(RealTimeError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealTimeInitial value)? initial,
    TResult Function(RealTimeLoading value)? loading,
    TResult Function(RealTimeLoaded value)? loaded,
    TResult Function(RealTimeLoadingPrediction value)? loadingPrediction,
    TResult Function(RealTimePredictionLoaded value)? predictionLoaded,
    TResult Function(RealTimeError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RealTimeLoaded implements RealTimeState {
  const factory RealTimeLoaded() = _$RealTimeLoaded;
}

/// @nodoc
abstract class $RealTimeLoadingPredictionCopyWith<$Res> {
  factory $RealTimeLoadingPredictionCopyWith(RealTimeLoadingPrediction value,
          $Res Function(RealTimeLoadingPrediction) then) =
      _$RealTimeLoadingPredictionCopyWithImpl<$Res>;
  $Res call({CameraImage image});
}

/// @nodoc
class _$RealTimeLoadingPredictionCopyWithImpl<$Res>
    extends _$RealTimeStateCopyWithImpl<$Res>
    implements $RealTimeLoadingPredictionCopyWith<$Res> {
  _$RealTimeLoadingPredictionCopyWithImpl(RealTimeLoadingPrediction _value,
      $Res Function(RealTimeLoadingPrediction) _then)
      : super(_value, (v) => _then(v as RealTimeLoadingPrediction));

  @override
  RealTimeLoadingPrediction get _value =>
      super._value as RealTimeLoadingPrediction;

  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(RealTimeLoadingPrediction(
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as CameraImage,
    ));
  }
}

/// @nodoc
class _$RealTimeLoadingPrediction implements RealTimeLoadingPrediction {
  const _$RealTimeLoadingPrediction(this.image);

  @override
  final CameraImage image;

  @override
  String toString() {
    return 'RealTimeState.loadingPrediction(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RealTimeLoadingPrediction &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  $RealTimeLoadingPredictionCopyWith<RealTimeLoadingPrediction> get copyWith =>
      _$RealTimeLoadingPredictionCopyWithImpl<RealTimeLoadingPrediction>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(CameraImage image) loadingPrediction,
    required TResult Function(
            CameraImage image, List<dynamic>? recognitionsList)
        predictionLoaded,
    required TResult Function(String? error, int? code) error,
  }) {
    return loadingPrediction(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(CameraImage image)? loadingPrediction,
    TResult Function(CameraImage image, List<dynamic>? recognitionsList)?
        predictionLoaded,
    TResult Function(String? error, int? code)? error,
    required TResult orElse(),
  }) {
    if (loadingPrediction != null) {
      return loadingPrediction(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealTimeInitial value) initial,
    required TResult Function(RealTimeLoading value) loading,
    required TResult Function(RealTimeLoaded value) loaded,
    required TResult Function(RealTimeLoadingPrediction value)
        loadingPrediction,
    required TResult Function(RealTimePredictionLoaded value) predictionLoaded,
    required TResult Function(RealTimeError value) error,
  }) {
    return loadingPrediction(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealTimeInitial value)? initial,
    TResult Function(RealTimeLoading value)? loading,
    TResult Function(RealTimeLoaded value)? loaded,
    TResult Function(RealTimeLoadingPrediction value)? loadingPrediction,
    TResult Function(RealTimePredictionLoaded value)? predictionLoaded,
    TResult Function(RealTimeError value)? error,
    required TResult orElse(),
  }) {
    if (loadingPrediction != null) {
      return loadingPrediction(this);
    }
    return orElse();
  }
}

abstract class RealTimeLoadingPrediction implements RealTimeState {
  const factory RealTimeLoadingPrediction(CameraImage image) =
      _$RealTimeLoadingPrediction;

  CameraImage get image => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RealTimeLoadingPredictionCopyWith<RealTimeLoadingPrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealTimePredictionLoadedCopyWith<$Res> {
  factory $RealTimePredictionLoadedCopyWith(RealTimePredictionLoaded value,
          $Res Function(RealTimePredictionLoaded) then) =
      _$RealTimePredictionLoadedCopyWithImpl<$Res>;
  $Res call({CameraImage image, List<dynamic>? recognitionsList});
}

/// @nodoc
class _$RealTimePredictionLoadedCopyWithImpl<$Res>
    extends _$RealTimeStateCopyWithImpl<$Res>
    implements $RealTimePredictionLoadedCopyWith<$Res> {
  _$RealTimePredictionLoadedCopyWithImpl(RealTimePredictionLoaded _value,
      $Res Function(RealTimePredictionLoaded) _then)
      : super(_value, (v) => _then(v as RealTimePredictionLoaded));

  @override
  RealTimePredictionLoaded get _value =>
      super._value as RealTimePredictionLoaded;

  @override
  $Res call({
    Object? image = freezed,
    Object? recognitionsList = freezed,
  }) {
    return _then(RealTimePredictionLoaded(
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as CameraImage,
      recognitionsList: recognitionsList == freezed
          ? _value.recognitionsList
          : recognitionsList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
class _$RealTimePredictionLoaded implements RealTimePredictionLoaded {
  const _$RealTimePredictionLoaded(this.image, {this.recognitionsList});

  @override
  final CameraImage image;
  @override
  final List<dynamic>? recognitionsList;

  @override
  String toString() {
    return 'RealTimeState.predictionLoaded(image: $image, recognitionsList: $recognitionsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RealTimePredictionLoaded &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.recognitionsList, recognitionsList) ||
                const DeepCollectionEquality()
                    .equals(other.recognitionsList, recognitionsList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(recognitionsList);

  @JsonKey(ignore: true)
  @override
  $RealTimePredictionLoadedCopyWith<RealTimePredictionLoaded> get copyWith =>
      _$RealTimePredictionLoadedCopyWithImpl<RealTimePredictionLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(CameraImage image) loadingPrediction,
    required TResult Function(
            CameraImage image, List<dynamic>? recognitionsList)
        predictionLoaded,
    required TResult Function(String? error, int? code) error,
  }) {
    return predictionLoaded(image, recognitionsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(CameraImage image)? loadingPrediction,
    TResult Function(CameraImage image, List<dynamic>? recognitionsList)?
        predictionLoaded,
    TResult Function(String? error, int? code)? error,
    required TResult orElse(),
  }) {
    if (predictionLoaded != null) {
      return predictionLoaded(image, recognitionsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealTimeInitial value) initial,
    required TResult Function(RealTimeLoading value) loading,
    required TResult Function(RealTimeLoaded value) loaded,
    required TResult Function(RealTimeLoadingPrediction value)
        loadingPrediction,
    required TResult Function(RealTimePredictionLoaded value) predictionLoaded,
    required TResult Function(RealTimeError value) error,
  }) {
    return predictionLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealTimeInitial value)? initial,
    TResult Function(RealTimeLoading value)? loading,
    TResult Function(RealTimeLoaded value)? loaded,
    TResult Function(RealTimeLoadingPrediction value)? loadingPrediction,
    TResult Function(RealTimePredictionLoaded value)? predictionLoaded,
    TResult Function(RealTimeError value)? error,
    required TResult orElse(),
  }) {
    if (predictionLoaded != null) {
      return predictionLoaded(this);
    }
    return orElse();
  }
}

abstract class RealTimePredictionLoaded implements RealTimeState {
  const factory RealTimePredictionLoaded(CameraImage image,
      {List<dynamic>? recognitionsList}) = _$RealTimePredictionLoaded;

  CameraImage get image => throw _privateConstructorUsedError;
  List<dynamic>? get recognitionsList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RealTimePredictionLoadedCopyWith<RealTimePredictionLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealTimeErrorCopyWith<$Res> {
  factory $RealTimeErrorCopyWith(
          RealTimeError value, $Res Function(RealTimeError) then) =
      _$RealTimeErrorCopyWithImpl<$Res>;
  $Res call({String? error, int? code});
}

/// @nodoc
class _$RealTimeErrorCopyWithImpl<$Res>
    extends _$RealTimeStateCopyWithImpl<$Res>
    implements $RealTimeErrorCopyWith<$Res> {
  _$RealTimeErrorCopyWithImpl(
      RealTimeError _value, $Res Function(RealTimeError) _then)
      : super(_value, (v) => _then(v as RealTimeError));

  @override
  RealTimeError get _value => super._value as RealTimeError;

  @override
  $Res call({
    Object? error = freezed,
    Object? code = freezed,
  }) {
    return _then(RealTimeError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
class _$RealTimeError implements RealTimeError {
  const _$RealTimeError({this.error, this.code});

  @override
  final String? error;
  @override
  final int? code;

  @override
  String toString() {
    return 'RealTimeState.error(error: $error, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RealTimeError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  $RealTimeErrorCopyWith<RealTimeError> get copyWith =>
      _$RealTimeErrorCopyWithImpl<RealTimeError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(CameraImage image) loadingPrediction,
    required TResult Function(
            CameraImage image, List<dynamic>? recognitionsList)
        predictionLoaded,
    required TResult Function(String? error, int? code) error,
  }) {
    return error(this.error, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(CameraImage image)? loadingPrediction,
    TResult Function(CameraImage image, List<dynamic>? recognitionsList)?
        predictionLoaded,
    TResult Function(String? error, int? code)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RealTimeInitial value) initial,
    required TResult Function(RealTimeLoading value) loading,
    required TResult Function(RealTimeLoaded value) loaded,
    required TResult Function(RealTimeLoadingPrediction value)
        loadingPrediction,
    required TResult Function(RealTimePredictionLoaded value) predictionLoaded,
    required TResult Function(RealTimeError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RealTimeInitial value)? initial,
    TResult Function(RealTimeLoading value)? loading,
    TResult Function(RealTimeLoaded value)? loaded,
    TResult Function(RealTimeLoadingPrediction value)? loadingPrediction,
    TResult Function(RealTimePredictionLoaded value)? predictionLoaded,
    TResult Function(RealTimeError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RealTimeError implements RealTimeState {
  const factory RealTimeError({String? error, int? code}) = _$RealTimeError;

  String? get error => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RealTimeErrorCopyWith<RealTimeError> get copyWith =>
      throw _privateConstructorUsedError;
}
