import 'package:multiple_result/multiple_result.dart';

import '../../domain/models/style_image.dart';
import '../../exceptions/app_exception.dart';

abstract class ArtsDataSource {
  Result<List<StyleImage>, AppException> get defaultArts;
  Result<StyleImage, AppException> findArtByName(String artName);
  List<StyleImage> get customArts;
  Future<Result<void, AppException>> loadDefaultImages();
  Future<Result<void, AppException>> loadCustomArts();
  Future<Result<void, AppException>> addCustomArt(StyleImage newCustomArt);
}
