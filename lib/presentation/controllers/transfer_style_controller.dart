import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picartsso/exceptions/app_exception.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../domain/services/art_service.dart';
import '../../domain/services/impl/art_service_impl.dart';
import '../../domain/services/impl/picture_image_service_impl.dart';
import '../../domain/services/impl/transfer_style_service_impl.dart';
import '../../domain/services/picture_image_service.dart';
import '../../domain/services/transfer_style_service.dart';
import 'state/pic_arts_state.dart';

final transferStyleControllerProvider = StateNotifierProvider.autoDispose<
    TransferStyleController, AsyncValue<PicArtsState>>(
  (ref) => TransferStyleController(
    ref.watch(artService),
    ref.watch(pictureImageService),
    ref.watch(transferStyleService),
  ),
);

class TransferStyleController extends StateNotifier<AsyncValue<PicArtsState>> {
  final ArtService _artService;
  final PictureImageService _pictureImageService;
  final TransferStyleService _transferStyleService;

  TransferStyleController(
    this._artService,
    this._pictureImageService,
    this._transferStyleService,
  ) : super(const AsyncValue.loading()) {
    _init();
  }

  void _init() {
    _artService.allArtsInOrder.when(
      (successArtsList) {
        state = AsyncValue.data(
          PicArtsState(
            arts: successArtsList,
            lastPicture: kTransparentImage,
            displayPicture: _pictureImageService.chosenPic,
            imageDataType: 'float16',
            isTransferedStyleToImage: false,
            isSaved: false,
          ),
        );
      },
      (error) {
        state = AsyncValue<PicArtsState>.error(
          error,
          StackTrace.current,
        );
      },
    );
  }

  Future<void> saveImageInGallery() async {
    state = const AsyncValue<PicArtsState>.loading().copyWithPrevious(state);

    var transformedImagesMap = _pictureImageService.transformedImages;
    if (transformedImagesMap.containsKey('float16') &&
        transformedImagesMap.containsKey('int8') &&
        transformedImagesMap['float16'] != null &&
        transformedImagesMap['float16']!.isNotEmpty &&
        transformedImagesMap['int8'] != null &&
        transformedImagesMap['int8']!.isNotEmpty) {
      var saveImagesResult = await _pictureImageService
          .saveAllImagesToGallery(transformedImagesMap);
      saveImagesResult.when(
        (success) {
          state = AsyncValue.data(
            state.value!.copyWith(
              isSaved: true,
            ),
          );
        },
        (error) {
          state = AsyncValue<PicArtsState>.error(
            error,
            StackTrace.current,
          ).copyWithPrevious(state);
        },
      );
    } else {
      state = AsyncError<PicArtsState>(
        const AppException.general(
            'Não há nenhuma foto / imagem transformada para salvar.'),
        StackTrace.current,
      ).copyWithPrevious(state);
    }
  }

  void selectSpecificBinaryType(String type) {
    var oldState = state.value!;
    if (oldState.isTransferedStyleToImage) {
      state = AsyncData(
        oldState.copyWith(
          displayPicture: _pictureImageService.transformedImages[type]!,
          imageDataType: type,
        ),
      );
    }
  }

  void transferStyle(Uint8List styleArt) {
    state = const AsyncLoading<PicArtsState>().copyWithPrevious(state);

    // Put here to show Loader Overlay working - Screen freezes when TF is executed
    //await Future.delayed(const Duration(milliseconds: 300));

    _transferStyleService
        .transferStyle(
      state.value!.lastPicture,
      styleArt,
    )
        .then((result) {
      result.when(
        (successTransformedPic) {
          state = AsyncData(
            state.value!.copyWith(
              displayPicture:
                  successTransformedPic[state.value!.imageDataType]!,
              isTransferedStyleToImage: true,
              isSaved: false,
            ),
          );
        },
        (error) {
          state = AsyncValue<PicArtsState>.error(
            error,
            StackTrace.current,
          ).copyWithPrevious(state);
        },
      );
    });
  }

  // Future<void> transferStyle(Uint8List styleArt) async {
  //   state = const AsyncLoading<PicArtsState>().copyWithPrevious(state);

  //   // Put here to show Loader Overlay working - Screen freezes when TF is executed
  //   await Future.delayed(const Duration(milliseconds: 300));

  //   var transformedPicsResult = await _transferStyleService.transferStyle(
  //     state.value!.lastPicture,
  //     styleArt,
  //   );

  //   transformedPicsResult.when(
  //     (successTransformedPic) {
  //       state = AsyncData(
  //         state.value!.copyWith(
  //           displayPicture: successTransformedPic[state.value!.imageDataType]!,
  //           isTransferedStyleToImage: true,
  //           isSaved: false,
  //         ),
  //       );
  //     },
  //     (error) {
  //       state = AsyncValue<PicArtsState>.error(
  //         error,
  //         StackTrace.current,
  //       ).copyWithPrevious(state);
  //     },
  //   );
  // }

  Future<void> addNewCustomArt() async {
    state = const AsyncLoading<PicArtsState>().copyWithPrevious(state);

    var pickNewCustomArtResult =
        await _artService.pickNewCustomArt(ImageSource.gallery);

    pickNewCustomArtResult.when(
      (gottenCustomArt) {
        _artService.allArtsInOrder.when(
          (successNewArtsList) {
            state = AsyncValue.data(
              state.value!.copyWith(
                arts: successNewArtsList,
              ),
            );
          },
          (error) {
            state = AsyncValue<PicArtsState>.error(
              error,
              StackTrace.current,
            ).copyWithPrevious(state);
          },
        );
      },
      (error) {
        state = AsyncValue<PicArtsState>.error(
          error,
          StackTrace.current,
        ).copyWithPrevious(state);
      },
    );
  }
}
