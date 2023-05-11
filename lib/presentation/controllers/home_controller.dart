import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/services/art_service.dart';
import '../../domain/services/impl/art_service_impl.dart';
import '../../domain/services/impl/picture_image_service_impl.dart';
import '../../domain/services/impl/transfer_style_service_impl.dart';
import '../../domain/services/picture_image_service.dart';
import '../../domain/services/transfer_style_service.dart';

final isInitialDataLoaded = StateProvider<bool>(
  (_) => false,
);

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeController, AsyncValue<void>>(
  (ref) => HomeController(
    ref.watch(artService),
    ref.watch(transferStyleService),
    ref.watch(pictureImageService),
    ref,
  ),
);

class HomeController extends StateNotifier<AsyncValue<void>> {
  final ArtService _artService;
  final TransferStyleService _transferStyleService;
  final PictureImageService _pictureImageService;
  final Ref _ref;

  HomeController(
    this._artService,
    this._transferStyleService,
    this._pictureImageService,
    this._ref,
  ) : super(const AsyncValue.loading()) {
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final isLoaded = _ref.read(isInitialDataLoaded);
    if (!isLoaded) {
      state = await AsyncValue.guard<void>(
        () async {
          final loadDefaultImages = await _artService.loadDefaultImages();
          if (loadDefaultImages.isError()) {
            state = AsyncValue.error(
              loadDefaultImages.tryGetError()!,
              StackTrace.current,
            );
            return;
          }
          final loadCustomArts = await _artService.loadCustomArts();
          if (loadCustomArts.isError()) {
            state = AsyncValue.error(
              loadCustomArts.tryGetError()!,
              StackTrace.current,
            );
            return;
          }

          final loadAIModels = await _transferStyleService.loadModel();
          if (loadAIModels.isError()) {
            state = AsyncValue.error(
              loadAIModels.tryGetError()!,
              StackTrace.current,
            );
            return;
          }
          _ref.read(isInitialDataLoaded.notifier).state = true;
          state = const AsyncValue.data(null);
        },
      );
    }
  }

  Future<void> pickImageFromSource(ImageSource imageSource) async {
    state = const AsyncValue.loading();
    final pickedImage =
        await _pictureImageService.pickImageFromSource(imageSource);
    pickedImage.when(
      (success) {
        _pictureImageService.chosenPic = success;
      },
      (error) => state = AsyncValue.error(
        error,
        StackTrace.current,
      ),
    );

    return;
  }
}
