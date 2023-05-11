import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../exceptions/app_exception.dart';

abstract class PictureDataSource {
  Future<Result<void, AppException>> saveImageToGallery(Uint8List imageBytes);
  Future<Result<void, AppException>> saveAllImagesToGallery(
      Map<String, Uint8List> images);
  set chosenPic(Uint8List image);
  Uint8List get chosenPic;
  Future<Result<Uint8List, AppException>> pickImageFromSource(
      ImageSource imageSource);
  Map<String, Uint8List> get transformedImages;
  set transformedImages(Map<String, Uint8List> transformedImages);
}
