import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picartsso/exceptions/app_exception.dart';

import 'package:multiple_result/multiple_result.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/repositories/picture_image_repository.dart';
import '../datasources/impl/picture_datasource_impl.dart';
import '../datasources/picture_datasource.dart';

final pictureImageRepository = Provider<PictureImageRepository>(
  (ref) => PictureImageRepositoryImpl(
    ref.watch(pictureDataSource),
  ),
);

class PictureImageRepositoryImpl implements PictureImageRepository {
  final PictureDataSource _pictureDataSource;

  PictureImageRepositoryImpl(this._pictureDataSource);

  @override
  Uint8List get chosenPic => _pictureDataSource.chosenPic;

  @override
  set chosenPic(Uint8List image) => _pictureDataSource.chosenPic = image;

  @override
  Future<Result<Uint8List, AppException>> pickImageFromSource(
      ImageSource imageSource) {
    return _pictureDataSource.pickImageFromSource(imageSource);
  }

  @override
  Future<Result<void, AppException>> saveAllImagesToGallery(
      Map<String, Uint8List> images) {
    return _pictureDataSource.saveAllImagesToGallery(
      images.map(
        (key, img) => MapEntry(key, img),
      ),
    );
  }

  @override
  Future<Result<void, AppException>> saveImageToGallery(Uint8List image) {
    return _pictureDataSource.saveImageToGallery(image);
  }

  @override
  Map<String, Uint8List> get transformedImages =>
      _pictureDataSource.transformedImages;

  @override
  set transformedImages(Map<String, Uint8List> transformedImages) {
    _pictureDataSource.transformedImages = transformedImages;
  }
}
