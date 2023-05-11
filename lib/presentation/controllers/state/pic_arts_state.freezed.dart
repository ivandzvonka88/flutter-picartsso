// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pic_arts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PicArtsState {
  List<StyleImage> get arts => throw _privateConstructorUsedError;
  Uint8List get lastPicture => throw _privateConstructorUsedError;
  Uint8List get displayPicture => throw _privateConstructorUsedError;
  String get imageDataType => throw _privateConstructorUsedError;
  bool get isTransferedStyleToImage => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PicArtsStateCopyWith<PicArtsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PicArtsStateCopyWith<$Res> {
  factory $PicArtsStateCopyWith(
          PicArtsState value, $Res Function(PicArtsState) then) =
      _$PicArtsStateCopyWithImpl<$Res, PicArtsState>;
  @useResult
  $Res call(
      {List<StyleImage> arts,
      Uint8List lastPicture,
      Uint8List displayPicture,
      String imageDataType,
      bool isTransferedStyleToImage,
      bool isSaved});
}

/// @nodoc
class _$PicArtsStateCopyWithImpl<$Res, $Val extends PicArtsState>
    implements $PicArtsStateCopyWith<$Res> {
  _$PicArtsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arts = null,
    Object? lastPicture = null,
    Object? displayPicture = null,
    Object? imageDataType = null,
    Object? isTransferedStyleToImage = null,
    Object? isSaved = null,
  }) {
    return _then(_value.copyWith(
      arts: null == arts
          ? _value.arts
          : arts // ignore: cast_nullable_to_non_nullable
              as List<StyleImage>,
      lastPicture: null == lastPicture
          ? _value.lastPicture
          : lastPicture // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      displayPicture: null == displayPicture
          ? _value.displayPicture
          : displayPicture // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      imageDataType: null == imageDataType
          ? _value.imageDataType
          : imageDataType // ignore: cast_nullable_to_non_nullable
              as String,
      isTransferedStyleToImage: null == isTransferedStyleToImage
          ? _value.isTransferedStyleToImage
          : isTransferedStyleToImage // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PicArtsStateCopyWith<$Res>
    implements $PicArtsStateCopyWith<$Res> {
  factory _$$_PicArtsStateCopyWith(
          _$_PicArtsState value, $Res Function(_$_PicArtsState) then) =
      __$$_PicArtsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<StyleImage> arts,
      Uint8List lastPicture,
      Uint8List displayPicture,
      String imageDataType,
      bool isTransferedStyleToImage,
      bool isSaved});
}

/// @nodoc
class __$$_PicArtsStateCopyWithImpl<$Res>
    extends _$PicArtsStateCopyWithImpl<$Res, _$_PicArtsState>
    implements _$$_PicArtsStateCopyWith<$Res> {
  __$$_PicArtsStateCopyWithImpl(
      _$_PicArtsState _value, $Res Function(_$_PicArtsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arts = null,
    Object? lastPicture = null,
    Object? displayPicture = null,
    Object? imageDataType = null,
    Object? isTransferedStyleToImage = null,
    Object? isSaved = null,
  }) {
    return _then(_$_PicArtsState(
      arts: null == arts
          ? _value._arts
          : arts // ignore: cast_nullable_to_non_nullable
              as List<StyleImage>,
      lastPicture: null == lastPicture
          ? _value.lastPicture
          : lastPicture // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      displayPicture: null == displayPicture
          ? _value.displayPicture
          : displayPicture // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      imageDataType: null == imageDataType
          ? _value.imageDataType
          : imageDataType // ignore: cast_nullable_to_non_nullable
              as String,
      isTransferedStyleToImage: null == isTransferedStyleToImage
          ? _value.isTransferedStyleToImage
          : isTransferedStyleToImage // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PicArtsState implements _PicArtsState {
  const _$_PicArtsState(
      {required final List<StyleImage> arts,
      required this.lastPicture,
      required this.displayPicture,
      required this.imageDataType,
      required this.isTransferedStyleToImage,
      required this.isSaved})
      : _arts = arts;

  final List<StyleImage> _arts;
  @override
  List<StyleImage> get arts {
    if (_arts is EqualUnmodifiableListView) return _arts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_arts);
  }

  @override
  final Uint8List lastPicture;
  @override
  final Uint8List displayPicture;
  @override
  final String imageDataType;
  @override
  final bool isTransferedStyleToImage;
  @override
  final bool isSaved;

  @override
  String toString() {
    return 'PicArtsState(arts: $arts, lastPicture: $lastPicture, displayPicture: $displayPicture, imageDataType: $imageDataType, isTransferedStyleToImage: $isTransferedStyleToImage, isSaved: $isSaved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PicArtsState &&
            const DeepCollectionEquality().equals(other._arts, _arts) &&
            const DeepCollectionEquality()
                .equals(other.lastPicture, lastPicture) &&
            const DeepCollectionEquality()
                .equals(other.displayPicture, displayPicture) &&
            (identical(other.imageDataType, imageDataType) ||
                other.imageDataType == imageDataType) &&
            (identical(
                    other.isTransferedStyleToImage, isTransferedStyleToImage) ||
                other.isTransferedStyleToImage == isTransferedStyleToImage) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_arts),
      const DeepCollectionEquality().hash(lastPicture),
      const DeepCollectionEquality().hash(displayPicture),
      imageDataType,
      isTransferedStyleToImage,
      isSaved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PicArtsStateCopyWith<_$_PicArtsState> get copyWith =>
      __$$_PicArtsStateCopyWithImpl<_$_PicArtsState>(this, _$identity);
}

abstract class _PicArtsState implements PicArtsState {
  const factory _PicArtsState(
      {required final List<StyleImage> arts,
      required final Uint8List lastPicture,
      required final Uint8List displayPicture,
      required final String imageDataType,
      required final bool isTransferedStyleToImage,
      required final bool isSaved}) = _$_PicArtsState;

  @override
  List<StyleImage> get arts;
  @override
  Uint8List get lastPicture;
  @override
  Uint8List get displayPicture;
  @override
  String get imageDataType;
  @override
  bool get isTransferedStyleToImage;
  @override
  bool get isSaved;
  @override
  @JsonKey(ignore: true)
  _$$_PicArtsStateCopyWith<_$_PicArtsState> get copyWith =>
      throw _privateConstructorUsedError;
}
