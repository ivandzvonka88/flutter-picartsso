import 'package:multiple_result/multiple_result.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../../exceptions/app_exception.dart';

abstract class AiModelsDataSource {
  Future<Result<void, AppException>> loadAiModels();
  Result<Interpreter, AppException> get interpreterPredictionFloat16;
  Result<Interpreter, AppException> get interpreterTransformFloat16;
  Result<Interpreter, AppException> get interpreterPredictionInt8;
  Result<Interpreter, AppException> get interpreterTransformInt8;
}
