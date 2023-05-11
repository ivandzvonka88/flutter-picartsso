import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) {
    return Uint8List.fromList(json.codeUnits);
  }

  @override
  String toJson(Uint8List object) {
    return String.fromCharCodes(object);
  }
}
