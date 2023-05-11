import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:picartsso/exceptions/app_exception.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../ai_models_datasource.dart';

final _interpreterPredictionFloat16 = StateProvider<Interpreter?>(
  (ref) => null,
);

final _interpreterPredictionInt8 = StateProvider<Interpreter?>(
  (ref) => null,
);

final _interpreterTransformFloat16 = StateProvider<Interpreter?>(
  (ref) => null,
);

final _interpreterTransformInt8 = StateProvider<Interpreter?>(
  (ref) => null,
);

final aiModelsDataSource = Provider<AiModelsDataSource>(
  (ref) => AiModelsDataSourceImpl(ref),
);

class AiModelsDataSourceImpl implements AiModelsDataSource {
  final _predictionModelFileFloat16 =
      'models/magenta_arbitrary-image-stylization-v1-256_fp16_prediction_1.tflite';
  final _transformModelFileFloat16 =
      'models/magenta_arbitrary-image-stylization-v1-256_fp16_transfer_1.tflite';

  final _predictionModelFileInt8 =
      'models/magenta_arbitrary-image-stylization-v1-256_int8_prediction_1.tflite';
  final _transformModelFileInt8 =
      'models/magenta_arbitrary-image-stylization-v1-256_int8_transfer_1.tflite';

  final Ref _ref;

  AiModelsDataSourceImpl(this._ref);

  // A classe Interpreter tem a função de carregar um modelo e conduzir a inferência do modelo.
  // Inferência é o termo que descreve o ato de utilizar uma rede neural para
  // fornecer insights após ela ter sido treinada. É como se alguém que
  // estudou algum assunto (passou por treinamento) e se formou,
  // estivesse indo trabalhar em um cenário da vida real (inferência).

  @override
  Result<Interpreter, AppException> get interpreterPredictionFloat16 {
    var interpreter = _ref.read(_interpreterPredictionFloat16);
    return (interpreter == null)
        ? const Error(AppException.general(
            "O modelo de transferencia não foi carregado."))
        : Success(interpreter);
  }

  @override
  Result<Interpreter, AppException> get interpreterPredictionInt8 {
    var interpreter = _ref.read(_interpreterPredictionInt8);
    return (interpreter == null)
        ? const Error(AppException.general(
            "O modelo de transferencia não foi carregado."))
        : Success(interpreter);
  }

  @override
  Result<Interpreter, AppException> get interpreterTransformFloat16 {
    var interpreter = _ref.read(_interpreterTransformFloat16);
    return (interpreter == null)
        ? const Error(AppException.general(
            "O modelo de transferencia não foi carregado."))
        : Success(interpreter);
  }

  @override
  Result<Interpreter, AppException> get interpreterTransformInt8 {
    var interpreter = _ref.read(_interpreterTransformFloat16);
    return (interpreter == null)
        ? const Error(AppException.general(
            "O modelo de transferencia não foi carregado."))
        : Success(interpreter);
  }

  @override
  Future<Result<void, AppException>> loadAiModels() async {
    try {
      var interpreterPredictionFloat16 =
          await Interpreter.fromAsset(_predictionModelFileFloat16);
      var interpreterTransformFloat16 =
          await Interpreter.fromAsset(_transformModelFileFloat16);
      var interpreterPredictionInt8 =
          await Interpreter.fromAsset(_predictionModelFileInt8);
      var interpreterTransformInt8 =
          await Interpreter.fromAsset(_transformModelFileInt8);

      _ref.read(_interpreterPredictionFloat16.notifier).state =
          interpreterPredictionFloat16;
      _ref.read(_interpreterTransformFloat16.notifier).state =
          interpreterTransformFloat16;
      _ref.read(_interpreterPredictionInt8.notifier).state =
          interpreterPredictionInt8;
      _ref.read(_interpreterTransformInt8.notifier).state =
          interpreterTransformInt8;
      return const Success(null);
    } on Exception catch (e) {
      return Error(
          AppException.general("Não pôde carregar o modelo de IA: $e"));
    }
  }
}
