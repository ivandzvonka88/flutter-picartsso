import 'package:image_picker/image_picker.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../exceptions/app_exception.dart';
import '../models/style_image.dart';

abstract class ArtService {
  Result<List<StyleImage>, AppException> get defaultArts;
  List<StyleImage> get customArts;

  Result<List<StyleImage>, AppException> get allArtsInOrder;

  Result<StyleImage, AppException> findArtByName(String artName);

  Future<Result<void, AppException>> loadDefaultImages();
  Future<Result<void, AppException>> loadCustomArts();

  Future<Result<StyleImage, AppException>> pickNewCustomArt(
      ImageSource imageSource);
}
