import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/style_image.dart';

part 'pic_arts_state.freezed.dart';

@freezed
class PicArtsState with _$PicArtsState {
  const factory PicArtsState({
    required List<StyleImage> arts,
    required Uint8List lastPicture,
    required Uint8List displayPicture,
    required String imageDataType,
    required bool isTransferedStyleToImage,
    required bool isSaved,
  }) = _PicArtsState;
}
