import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../exceptions/app_exception.dart';
import '../picture_datasource.dart';

final _chosenPic = StateProvider<Uint8List>(
  (_) => Uint8List(0),
);

final _transformedPic = StateProvider<Map<String, Uint8List>>(
  (_) => <String, Uint8List>{},
);

final pictureDataSource = Provider<PictureDataSource>(
  (ref) => PictureDataSourceImpl(
    ref,
    ImagePicker(),
    DeviceInfoPlugin(),
  ),
);

class PictureDataSourceImpl implements PictureDataSource {
  final Ref _ref;
  final ImagePicker _imagePicker;
  final DeviceInfoPlugin _deviceInfoPlugin;

  PictureDataSourceImpl(
    this._ref,
    this._imagePicker,
    this._deviceInfoPlugin,
  );

  /// If it exists a chosen picture, it'll return a valid Uint8List. Otherwise, it'll return Uint8List(0)
  @override
  Uint8List get chosenPic => _ref.read(_chosenPic);

  @override
  set chosenPic(Uint8List image) {
    _ref.read(_chosenPic.notifier).state = image;
  }

  @override
  Future<Result<void, AppException>> saveAllImagesToGallery(
      Map<String, Uint8List> images) async {
    var status = await Permission.photos.status;
    print("PERMISSION GALLERY STATUS: $status");
    var currentStatus = await Permission.photos.request();
    if (currentStatus.isGranted) {
      if (images.containsKey('float16') && images['float16'] != null) {
        await ImageGallerySaver.saveImage(
          images['float16']!,
          name: "transformedImageFloat16--${DateTime.now().toIso8601String()}",
        );
      } else {
        return const Error(AppException.general(
            "There isn't a transformed image of type Float16"));
      }
      if (images.containsKey('int8') && images['int8'] != null) {
        await ImageGallerySaver.saveImage(
          images['int8']!,
          name: "transformedImageInt8--${DateTime.now().toIso8601String()}",
        );
      } else {
        return const Error(AppException.general(
            "There isn't a transformed image of type Int8"));
      }
      return const Success(null);
    }
    return const Error(AppException.permission(Permission.photos));
  }

  @override
  Future<Result<void, AppException>> saveImageToGallery(
      Uint8List imageBytes) async {
    late final Permission permissionSource;
    final androidInfo = await _deviceInfoPlugin.androidInfo;
    if (Platform.isAndroid && androidInfo.version.sdkInt <= 32) {
      permissionSource = Permission.storage;
    } else {
      permissionSource = Permission.photos;
    }
    if (await permissionSource.request().isGranted) {
      await ImageGallerySaver.saveImage(
        imageBytes,
        name: "transformedImage${DateTime.now().toIso8601String()}",
      );
      return const Success(null);
    }
    return const Error(AppException.permission(Permission.photos));
  }

  @override
  Future<Result<Uint8List, AppException>> pickImageFromSource(
      ImageSource imageSource) async {
    final Permission permissionSource;
    final androidInfo = await _deviceInfoPlugin.androidInfo;
    switch (imageSource) {
      case ImageSource.gallery:
        // Temporary FIX for bug in permission_handler of DENIED status
        if (Platform.isAndroid && androidInfo.version.sdkInt <= 32) {
          permissionSource = Permission.storage;
          break;
        }
        permissionSource = Permission.photos;
        break;
      case ImageSource.camera:
        permissionSource = Permission.camera;
        break;
      default:
        return const Error(AppException.general("Unknown image source."));
    }

    print(
        "PERMISSION $permissionSource STATUS: ${await permissionSource.status}");
    if (await permissionSource.request().isGranted) {
      var image = await _imagePicker.pickImage(source: imageSource);
      if (image != null) {
        return Success(await image.readAsBytes());
      } else {
        return const Error(
          AppException.noPic(),
        );
      }
    }
    return Error(AppException.permission(permissionSource));
  }

  @override
  Map<String, Uint8List> get transformedImages => _ref.read(_transformedPic);

  @override
  set transformedImages(Map<String, Uint8List> transformedImages) {
    _ref.read(_transformedPic.notifier).state = transformedImages;
  }
}
