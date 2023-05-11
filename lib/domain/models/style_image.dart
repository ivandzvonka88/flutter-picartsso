// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../util/converters/uint8list_converter.dart';

part 'style_image.freezed.dart';
part 'style_image.g.dart';

@freezed
class StyleImage with _$StyleImage {
  const factory StyleImage({
    required String artName,
    required String authorName,
    @Uint8ListConverter() required Uint8List image,
  }) = _StyleImage;

  factory StyleImage.fromJson(Map<String, Object?> json) =>
      _$StyleImageFromJson(json);
}
