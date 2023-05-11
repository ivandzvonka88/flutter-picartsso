// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'style_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StyleImage _$$_StyleImageFromJson(Map<String, dynamic> json) =>
    _$_StyleImage(
      artName: json['artName'] as String,
      authorName: json['authorName'] as String,
      image: const Uint8ListConverter().fromJson(json['image'] as String),
    );

Map<String, dynamic> _$$_StyleImageToJson(_$_StyleImage instance) =>
    <String, dynamic>{
      'artName': instance.artName,
      'authorName': instance.authorName,
      'image': const Uint8ListConverter().toJson(instance.image),
    };
