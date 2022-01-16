// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'gallery_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GalleryStateTearOff {
  const _$GalleryStateTearOff();

  GalleryInitial initial() {
    return const GalleryInitial();
  }

  GalleryLoading loading() {
    return const GalleryLoading();
  }

  GalleryLoadingPrediction loadingPrediction(File image) {
    return GalleryLoadingPrediction(
      image,
    );
  }

  GalleryPredictionLoaded predictionLoaded(File image,
      {List<dynamic>? output}) {
    return GalleryPredictionLoaded(
      image,
      output: output,
    );
  }

  GalleryError error({String? error, int? code}) {
    return GalleryError(
      error: error,
      code: code,
    );
  }
}

/// @nodoc
const $GalleryState = _$GalleryStateTearOff();

/// @nodoc
mixin _$GalleryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(File image) loadingPrediction,
    required TResult Function(File image, List<dynamic>? output)
        predictionLoaded,
    required TResult Function(String? error, int? code) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(File image)? loadingPrediction,
    TResult Function(File image, List<dynamic>? output)? predictionLoaded,
    TResult Function(String? error, int? code)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GalleryInitial value) initial,
    required TResult Function(GalleryLoading value) loading,
    required TResult Function(GalleryLoadingPrediction value) loadingPrediction,
    required TResult Function(GalleryPredictionLoaded value) predictionLoaded,
    required TResult Function(GalleryError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GalleryInitial value)? initial,
    TResult Function(GalleryLoading value)? loading,
    TResult Function(GalleryLoadingPrediction value)? loadingPrediction,
    TResult Function(GalleryPredictionLoaded value)? predictionLoaded,
    TResult Function(GalleryError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryStateCopyWith<$Res> {
  factory $GalleryStateCopyWith(
          GalleryState value, $Res Function(GalleryState) then) =
      _$GalleryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GalleryStateCopyWithImpl<$Res> implements $GalleryStateCopyWith<$Res> {
  _$GalleryStateCopyWithImpl(this._value, this._then);

  final GalleryState _value;
  // ignore: unused_field
  final $Res Function(GalleryState) _then;
}

/// @nodoc
abstract class $GalleryInitialCopyWith<$Res> {
  factory $GalleryInitialCopyWith(
          GalleryInitial value, $Res Function(GalleryInitial) then) =
      _$GalleryInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$GalleryInitialCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res>
    implements $GalleryInitialCopyWith<$Res> {
  _$GalleryInitialCopyWithImpl(
      GalleryInitial _value, $Res Function(GalleryInitial) _then)
      : super(_value, (v) => _then(v as GalleryInitial));

  @override
  GalleryInitial get _value => super._value as GalleryInitial;
}

/// @nodoc
class _$GalleryInitial implements GalleryInitial {
  const _$GalleryInitial();

  @override
  String toString() {
    return 'GalleryState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GalleryInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(File image) loadingPrediction,
    required TResult Function(File image, List<dynamic>? output)
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
    TResult Function(File image)? loadingPrediction,
    TResult Function(File image, List<dynamic>? output)? predictionLoaded,
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
    required TResult Function(GalleryInitial value) initial,
    required TResult Function(GalleryLoading value) loading,
    required TResult Function(GalleryLoadingPrediction value) loadingPrediction,
    required TResult Function(GalleryPredictionLoaded value) predictionLoaded,
    required TResult Function(GalleryError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GalleryInitial value)? initial,
    TResult Function(GalleryLoading value)? loading,
    TResult Function(GalleryLoadingPrediction value)? loadingPrediction,
    TResult Function(GalleryPredictionLoaded value)? predictionLoaded,
    TResult Function(GalleryError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GalleryInitial implements GalleryState {
  const factory GalleryInitial() = _$GalleryInitial;
}

/// @nodoc
abstract class $GalleryLoadingCopyWith<$Res> {
  factory $GalleryLoadingCopyWith(
          GalleryLoading value, $Res Function(GalleryLoading) then) =
      _$GalleryLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$GalleryLoadingCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res>
    implements $GalleryLoadingCopyWith<$Res> {
  _$GalleryLoadingCopyWithImpl(
      GalleryLoading _value, $Res Function(GalleryLoading) _then)
      : super(_value, (v) => _then(v as GalleryLoading));

  @override
  GalleryLoading get _value => super._value as GalleryLoading;
}

/// @nodoc
class _$GalleryLoading implements GalleryLoading {
  const _$GalleryLoading();

  @override
  String toString() {
    return 'GalleryState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GalleryLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(File image) loadingPrediction,
    required TResult Function(File image, List<dynamic>? output)
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
    TResult Function(File image)? loadingPrediction,
    TResult Function(File image, List<dynamic>? output)? predictionLoaded,
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
    required TResult Function(GalleryInitial value) initial,
    required TResult Function(GalleryLoading value) loading,
    required TResult Function(GalleryLoadingPrediction value) loadingPrediction,
    required TResult Function(GalleryPredictionLoaded value) predictionLoaded,
    required TResult Function(GalleryError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GalleryInitial value)? initial,
    TResult Function(GalleryLoading value)? loading,
    TResult Function(GalleryLoadingPrediction value)? loadingPrediction,
    TResult Function(GalleryPredictionLoaded value)? predictionLoaded,
    TResult Function(GalleryError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GalleryLoading implements GalleryState {
  const factory GalleryLoading() = _$GalleryLoading;
}

/// @nodoc
abstract class $GalleryLoadingPredictionCopyWith<$Res> {
  factory $GalleryLoadingPredictionCopyWith(GalleryLoadingPrediction value,
          $Res Function(GalleryLoadingPrediction) then) =
      _$GalleryLoadingPredictionCopyWithImpl<$Res>;
  $Res call({File image});
}

/// @nodoc
class _$GalleryLoadingPredictionCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res>
    implements $GalleryLoadingPredictionCopyWith<$Res> {
  _$GalleryLoadingPredictionCopyWithImpl(GalleryLoadingPrediction _value,
      $Res Function(GalleryLoadingPrediction) _then)
      : super(_value, (v) => _then(v as GalleryLoadingPrediction));

  @override
  GalleryLoadingPrediction get _value =>
      super._value as GalleryLoadingPrediction;

  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(GalleryLoadingPrediction(
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc
class _$GalleryLoadingPrediction implements GalleryLoadingPrediction {
  const _$GalleryLoadingPrediction(this.image);

  @override
  final File image;

  @override
  String toString() {
    return 'GalleryState.loadingPrediction(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GalleryLoadingPrediction &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  $GalleryLoadingPredictionCopyWith<GalleryLoadingPrediction> get copyWith =>
      _$GalleryLoadingPredictionCopyWithImpl<GalleryLoadingPrediction>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(File image) loadingPrediction,
    required TResult Function(File image, List<dynamic>? output)
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
    TResult Function(File image)? loadingPrediction,
    TResult Function(File image, List<dynamic>? output)? predictionLoaded,
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
    required TResult Function(GalleryInitial value) initial,
    required TResult Function(GalleryLoading value) loading,
    required TResult Function(GalleryLoadingPrediction value) loadingPrediction,
    required TResult Function(GalleryPredictionLoaded value) predictionLoaded,
    required TResult Function(GalleryError value) error,
  }) {
    return loadingPrediction(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GalleryInitial value)? initial,
    TResult Function(GalleryLoading value)? loading,
    TResult Function(GalleryLoadingPrediction value)? loadingPrediction,
    TResult Function(GalleryPredictionLoaded value)? predictionLoaded,
    TResult Function(GalleryError value)? error,
    required TResult orElse(),
  }) {
    if (loadingPrediction != null) {
      return loadingPrediction(this);
    }
    return orElse();
  }
}

abstract class GalleryLoadingPrediction implements GalleryState {
  const factory GalleryLoadingPrediction(File image) =
      _$GalleryLoadingPrediction;

  File get image => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryLoadingPredictionCopyWith<GalleryLoadingPrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryPredictionLoadedCopyWith<$Res> {
  factory $GalleryPredictionLoadedCopyWith(GalleryPredictionLoaded value,
          $Res Function(GalleryPredictionLoaded) then) =
      _$GalleryPredictionLoadedCopyWithImpl<$Res>;
  $Res call({File image, List<dynamic>? output});
}

/// @nodoc
class _$GalleryPredictionLoadedCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res>
    implements $GalleryPredictionLoadedCopyWith<$Res> {
  _$GalleryPredictionLoadedCopyWithImpl(GalleryPredictionLoaded _value,
      $Res Function(GalleryPredictionLoaded) _then)
      : super(_value, (v) => _then(v as GalleryPredictionLoaded));

  @override
  GalleryPredictionLoaded get _value => super._value as GalleryPredictionLoaded;

  @override
  $Res call({
    Object? image = freezed,
    Object? output = freezed,
  }) {
    return _then(GalleryPredictionLoaded(
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File,
      output: output == freezed
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
class _$GalleryPredictionLoaded implements GalleryPredictionLoaded {
  const _$GalleryPredictionLoaded(this.image, {this.output});

  @override
  final File image;
  @override
  final List<dynamic>? output;

  @override
  String toString() {
    return 'GalleryState.predictionLoaded(image: $image, output: $output)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GalleryPredictionLoaded &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.output, output) ||
                const DeepCollectionEquality().equals(other.output, output)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(output);

  @JsonKey(ignore: true)
  @override
  $GalleryPredictionLoadedCopyWith<GalleryPredictionLoaded> get copyWith =>
      _$GalleryPredictionLoadedCopyWithImpl<GalleryPredictionLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(File image) loadingPrediction,
    required TResult Function(File image, List<dynamic>? output)
        predictionLoaded,
    required TResult Function(String? error, int? code) error,
  }) {
    return predictionLoaded(image, output);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(File image)? loadingPrediction,
    TResult Function(File image, List<dynamic>? output)? predictionLoaded,
    TResult Function(String? error, int? code)? error,
    required TResult orElse(),
  }) {
    if (predictionLoaded != null) {
      return predictionLoaded(image, output);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GalleryInitial value) initial,
    required TResult Function(GalleryLoading value) loading,
    required TResult Function(GalleryLoadingPrediction value) loadingPrediction,
    required TResult Function(GalleryPredictionLoaded value) predictionLoaded,
    required TResult Function(GalleryError value) error,
  }) {
    return predictionLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GalleryInitial value)? initial,
    TResult Function(GalleryLoading value)? loading,
    TResult Function(GalleryLoadingPrediction value)? loadingPrediction,
    TResult Function(GalleryPredictionLoaded value)? predictionLoaded,
    TResult Function(GalleryError value)? error,
    required TResult orElse(),
  }) {
    if (predictionLoaded != null) {
      return predictionLoaded(this);
    }
    return orElse();
  }
}

abstract class GalleryPredictionLoaded implements GalleryState {
  const factory GalleryPredictionLoaded(File image, {List<dynamic>? output}) =
      _$GalleryPredictionLoaded;

  File get image => throw _privateConstructorUsedError;
  List<dynamic>? get output => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryPredictionLoadedCopyWith<GalleryPredictionLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryErrorCopyWith<$Res> {
  factory $GalleryErrorCopyWith(
          GalleryError value, $Res Function(GalleryError) then) =
      _$GalleryErrorCopyWithImpl<$Res>;
  $Res call({String? error, int? code});
}

/// @nodoc
class _$GalleryErrorCopyWithImpl<$Res> extends _$GalleryStateCopyWithImpl<$Res>
    implements $GalleryErrorCopyWith<$Res> {
  _$GalleryErrorCopyWithImpl(
      GalleryError _value, $Res Function(GalleryError) _then)
      : super(_value, (v) => _then(v as GalleryError));

  @override
  GalleryError get _value => super._value as GalleryError;

  @override
  $Res call({
    Object? error = freezed,
    Object? code = freezed,
  }) {
    return _then(GalleryError(
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
class _$GalleryError implements GalleryError {
  const _$GalleryError({this.error, this.code});

  @override
  final String? error;
  @override
  final int? code;

  @override
  String toString() {
    return 'GalleryState.error(error: $error, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GalleryError &&
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
  $GalleryErrorCopyWith<GalleryError> get copyWith =>
      _$GalleryErrorCopyWithImpl<GalleryError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(File image) loadingPrediction,
    required TResult Function(File image, List<dynamic>? output)
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
    TResult Function(File image)? loadingPrediction,
    TResult Function(File image, List<dynamic>? output)? predictionLoaded,
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
    required TResult Function(GalleryInitial value) initial,
    required TResult Function(GalleryLoading value) loading,
    required TResult Function(GalleryLoadingPrediction value) loadingPrediction,
    required TResult Function(GalleryPredictionLoaded value) predictionLoaded,
    required TResult Function(GalleryError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GalleryInitial value)? initial,
    TResult Function(GalleryLoading value)? loading,
    TResult Function(GalleryLoadingPrediction value)? loadingPrediction,
    TResult Function(GalleryPredictionLoaded value)? predictionLoaded,
    TResult Function(GalleryError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GalleryError implements GalleryState {
  const factory GalleryError({String? error, int? code}) = _$GalleryError;

  String? get error => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryErrorCopyWith<GalleryError> get copyWith =>
      throw _privateConstructorUsedError;
}
