import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:image/image.dart' as image_formatter;

import '../../../data/repositories/ai_models_repository_impl.dart';
import '../../../data/repositories/picture_image_repository_impl.dart';
import '../../../exceptions/app_exception.dart';
import '../../repositories/ai_models_repository.dart';
import '../../repositories/picture_image_repository.dart';
import '../transfer_style_service.dart';

final transferStyleService = Provider<TransferStyleService>(
  (ref) => TransferStyleServiceImpl(
    ref.watch(aiModelsRepository),
    ref.watch(pictureImageRepository),
  ),
);

class TransferStyleServiceImpl implements TransferStyleService {
  final AiModelsRepository _aiModelsRepository;
  final PictureImageRepository _pictureImageRepository;

  TransferStyleServiceImpl(
    this._aiModelsRepository,
    this._pictureImageRepository,
  );

  // A imagem do conteúdo deve ser (1, 384, 384, 3). Recortamos a imagem centralmente e a redimensionamos.
  static const int modelTransferImageSize = 384;

  // O tamanho da imagem do estilo deve ser (1, 256, 256, 3). Recortamos a imagem centralmente e a redimensionamos.
  static const int modelPredictionImageSize = 256;

  // Função que carregará os modelos
  @override
  Future<Result<void, AppException>> loadModel() =>
      _aiModelsRepository.loadAiModels();

  @override
  Future<Result<Map<String, Uint8List>, AppException>> transferStyle(
      Uint8List originalPicture, Uint8List stylePicture) async {
    var decodedOriginalImage = image_formatter.decodeImage(originalPicture);

    if (decodedOriginalImage == null) {
      return Future.error("Invalid origin image");
    }

    var decodedStyleImage = image_formatter.decodeImage(stylePicture);
    // style_image 256 256 3

    if (decodedStyleImage == null) {
      return Future.error("Invalid style image");
    }

    //Resize images
    var modelTransferImageFloat16 = image_formatter.copyResize(
        decodedOriginalImage,
        width: modelTransferImageSize,
        height: modelTransferImageSize);

    var modelTransferImageInt8 = modelTransferImageFloat16.clone();

    var modelTransferInputFloat16 = _imageToByteListUInt8(
        modelTransferImageFloat16, modelTransferImageSize, 0, 255);

    var modelTransferInputInt8 = _imageToByteListUInt8(
        modelTransferImageInt8, modelTransferImageSize, 0, 255);

    print(
        "Style Image Size : ${decodedStyleImage.height} ${decodedStyleImage.width} ${decodedStyleImage.xOffset} ${decodedStyleImage.yOffset}");

    var modelPredictionImageFloat16 = image_formatter.copyResize(
        decodedStyleImage,
        width: modelPredictionImageSize,
        height: modelPredictionImageSize);

    var modelPredictionImageInt8 = modelPredictionImageFloat16.clone();

    // content_image 384 384 3
    var modelPredictionInputFloat16 = _imageToByteListUInt8(
        modelPredictionImageFloat16, modelPredictionImageSize, 0, 255);

    var modelPredictionInputInt8 = _imageToByteListUInt8(
        modelPredictionImageInt8, modelPredictionImageSize, 0, 255);

    // var modelPredictionInputImage =
    //     imageFormatter.decodeImage(modelPredictionInput);
    // print(
    //     "Prediction Image Size : ${modelPredictionInputImage?.height} ${modelPredictionInputImage?.width} ${modelPredictionInputImage?.xOffset} ${modelPredictionInputImage?.yOffset}");

    // Preparing for Prediction
    // style_image 1 256 256 3
    var inputsForPredictionFloat16 = [modelPredictionInputFloat16];
    var inputsForPredictionInt8 = [modelPredictionInputInt8];

    // style_bottleneck 1 1 100
    var outputsForPredictionFloat16 = <int, Object>{};
    var outputsForPredictionInt8 = <int, Object>{};
    var styleBottleneckFloat16 = [
      [
        [List.generate(100, (index) => 0.0)]
      ]
    ];

    var styleBottleneckInt8 = [
      [
        [List.generate(100, (index) => 0.0)]
      ]
    ];

    outputsForPredictionFloat16[0] = styleBottleneckFloat16;
    outputsForPredictionInt8[0] = styleBottleneckInt8;

    // style predict model Float 16
    // Check if interpreter has loaded the model
    if (_aiModelsRepository.interpreterPredictionFloat16.isError()) {
      return Error(
          _aiModelsRepository.interpreterPredictionFloat16.tryGetError()!);
    }
    _aiModelsRepository.interpreterPredictionFloat16
        .tryGetSuccess()!
        .runForMultipleInputs(
            inputsForPredictionFloat16, outputsForPredictionFloat16);

    // style predict model Int 8
    // Check if interpreter has loaded the model
    if (_aiModelsRepository.interpreterPredictionInt8.isError()) {
      return Error(
          _aiModelsRepository.interpreterPredictionInt8.tryGetError()!);
    }
    _aiModelsRepository.interpreterPredictionInt8
        .tryGetSuccess()!
        .runForMultipleInputs(
            inputsForPredictionInt8, outputsForPredictionInt8);

    // Now, to prepare for Transform
    // content_image + styleBottleneck
    var inputsForStyleTransferFloat16 = [
      modelTransferInputFloat16,
      styleBottleneckFloat16
    ];

    var inputsForStyleTransferInt8 = [
      modelTransferInputInt8,
      styleBottleneckInt8
    ];

    var outputsForStyleTransferFloat16 = <int, Object>{};
    var outputsForStyleTransferInt8 = <int, Object>{};
    // stylized_image 1 384 384 3
    var outputImageDataFloat16 = [
      List.generate(
        modelTransferImageSize,
        (index) => List.generate(
          modelTransferImageSize,
          (index) => List.generate(3, (index) => 0.0),
        ),
      ),
    ];
    var outputImageDataInt8 = [
      List.generate(
        modelTransferImageSize,
        (index) => List.generate(
          modelTransferImageSize,
          (index) => List.generate(3, (index) => 0.0),
        ),
      ),
    ];
    outputsForStyleTransferFloat16[0] = outputImageDataFloat16;
    outputsForStyleTransferInt8[0] = outputImageDataInt8;

    if (_aiModelsRepository.interpreterTransformFloat16.isError()) {
      return Error(
          _aiModelsRepository.interpreterTransformFloat16.tryGetError()!);
    }
    _aiModelsRepository.interpreterTransformFloat16
        .tryGetSuccess()!
        .runForMultipleInputs(
            inputsForStyleTransferFloat16, outputsForStyleTransferFloat16);

    if (_aiModelsRepository.interpreterTransformInt8.isError()) {
      return Error(_aiModelsRepository.interpreterTransformInt8.tryGetError()!);
    }
    _aiModelsRepository.interpreterTransformInt8
        .tryGetSuccess()!
        .runForMultipleInputs(
            inputsForStyleTransferInt8, outputsForStyleTransferInt8);

    // AQUI - Criar 2 endodedImage : Float16 e Int8 - com o código abaixo

    final transformedPictures = <String, Uint8List>{};

    transformedPictures['float16'] =
        encodeOutputImage(outputImageDataFloat16, decodedOriginalImage);
    transformedPictures['int8'] =
        encodeOutputImage(outputImageDataInt8, decodedOriginalImage);

    if (transformedPictures['float16']!.isEmpty) {
      return const Error(
        AppException.general(
            "Não foi possível fazer a transferencia de estilo para a imagem solicitada no formato binário FLOAT16. Tente novamente."),
      );
    }

    if (transformedPictures['int8']!.isEmpty) {
      return const Error(
        AppException.general(
            "Não foi possível fazer a transferencia de estilo para a imagem solicitada no formato binário INT8. Tente novamente."),
      );
    }

    // Save locally
    _pictureImageRepository.transformedImages = transformedPictures;

    return Success(transformedPictures);
  }

  // HELPER
  Uint8List encodeOutputImage(List<List<List<List<double>>>> outputImageData,
      image_formatter.Image decodedOriginalImage) {
    var outputImage =
        _convertArrayToImage(outputImageData, modelTransferImageSize);
    var rotateOutputImageFloat16 = image_formatter.copyRotate(outputImage, 90);
    var flipOutputImage =
        image_formatter.flipHorizontal(rotateOutputImageFloat16);
    var resultImage = image_formatter.copyResize(flipOutputImage,
        width: decodedOriginalImage.width, height: decodedOriginalImage.height);
    var encodedImage =
        Uint8List.fromList(image_formatter.encodeJpg(resultImage));
    return encodedImage;
  }

  // BELLOW HELPERS ARE LOCAL BECAUSE THEY ARE ONLY GOING TO BE USED INSIDE THIS SERVICE

  // HELPER : Convert Array to Image
  image_formatter.Image _convertArrayToImage(
      List<List<List<List<double>>>> imageArray, int inputSize) {
    image_formatter.Image image =
        image_formatter.Image.rgb(inputSize, inputSize);
    for (var x = 0; x < imageArray[0].length; x++) {
      for (var y = 0; y < imageArray[0][0].length; y++) {
        var r = (imageArray[0][x][y][0] * 255).toInt();
        var g = (imageArray[0][x][y][1] * 255).toInt();
        var b = (imageArray[0][x][y][2] * 255).toInt();
        image.setPixelRgba(x, y, r, g, b);
      }
    }
    return image;
  }

  // HELPER : Convert Image to Uint8List
  Uint8List _imageToByteListUInt8(
    image_formatter.Image image,
    int inputSize,
    double mean,
    double std,
  ) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (image_formatter.getRed(pixel) - mean) / std;
        buffer[pixelIndex++] = (image_formatter.getGreen(pixel) - mean) / std;
        buffer[pixelIndex++] = (image_formatter.getBlue(pixel) - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }
}
