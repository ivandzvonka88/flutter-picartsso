// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'style_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StyleImage _$StyleImageFromJson(Map<String, dynamic> json) {
  return _StyleImage.fromJson(json);
}

/// @nodoc
mixin _$StyleImage {
  String get artName => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StyleImageCopyWith<StyleImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StyleImageCopyWith<$Res> {
  factory $StyleImageCopyWith(
          StyleImage value, $Res Function(StyleImage) then) =
      _$StyleImageCopyWithImpl<$Res, StyleImage>;
  @useResult
  $Res call(
      {String artName,
      String authorName,
      @Uint8ListConverter() Uint8List image});
}

/// @nodoc
class _$StyleImageCopyWithImpl<$Res, $Val extends StyleImage>
    implements $StyleImageCopyWith<$Res> {
  _$StyleImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artName = null,
    Object? authorName = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      artName: null == artName
          ? _value.artName
          : artName // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StyleImageCopyWith<$Res>
    implements $StyleImageCopyWith<$Res> {
  factory _$$_StyleImageCopyWith(
          _$_StyleImage value, $Res Function(_$_StyleImage) then) =
      __$$_StyleImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String artName,
      String authorName,
      @Uint8ListConverter() Uint8List image});
}

/// @nodoc
class __$$_StyleImageCopyWithImpl<$Res>
    extends _$StyleImageCopyWithImpl<$Res, _$_StyleImage>
    implements _$$_StyleImageCopyWith<$Res> {
  __$$_StyleImageCopyWithImpl(
      _$_StyleImage _value, $Res Function(_$_StyleImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artName = null,
    Object? authorName = null,
    Object? image = null,
  }) {
    return _then(_$_StyleImage(
      artName: null == artName
          ? _value.artName
          : artName // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StyleImage with DiagnosticableTreeMixin implements _StyleImage {
  const _$_StyleImage(
      {required this.artName,
      required this.authorName,
      @Uint8ListConverter() required this.image});

  factory _$_StyleImage.fromJson(Map<String, dynamic> json) =>
      _$$_StyleImageFromJson(json);

  @override
  final String artName;
  @override
  final String authorName;
  @override
  @Uint8ListConverter()
  final Uint8List image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StyleImage(artName: $artName, authorName: $authorName, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StyleImage'))
      ..add(DiagnosticsProperty('artName', artName))
      ..add(DiagnosticsProperty('authorName', authorName))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StyleImage &&
            (identical(other.artName, artName) || other.artName == artName) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, artName, authorName,
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StyleImageCopyWith<_$_StyleImage> get copyWith =>
      __$$_StyleImageCopyWithImpl<_$_StyleImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StyleImageToJson(
      this,
    );
  }
}

abstract class _StyleImage implements StyleImage {
  const factory _StyleImage(
      {required final String artName,
      required final String authorName,
      @Uint8ListConverter() required final Uint8List image}) = _$_StyleImage;

  factory _StyleImage.fromJson(Map<String, dynamic> json) =
      _$_StyleImage.fromJson;

  @override
  String get artName;
  @override
  String get authorName;
  @override
  @Uint8ListConverter()
  Uint8List get image;
  @override
  @JsonKey(ignore: true)
  _$$_StyleImageCopyWith<_$_StyleImage> get copyWith =>
      throw _privateConstructorUsedError;
}
