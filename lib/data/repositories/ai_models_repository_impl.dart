import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:picartsso/exceptions/app_exception.dart';

import 'package:multiple_result/multiple_result.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../../domain/repositories/ai_models_repository.dart';
import '../datasources/ai_models_datasource.dart';
import '../datasources/impl/ai_models_datasource_impl.dart';

final aiModelsRepository = Provider<AiModelsRepository>(
  (ref) => AiModelsRepositoryImpl(ref.watch(aiModelsDataSource)),
);

class AiModelsRepositoryImpl implements AiModelsRepository {
  final AiModelsDataSource _aiModelsDataSource;

  AiModelsRepositoryImpl(this._aiModelsDataSource);

  @override
  Result<Interpreter, AppException> get interpreterPredictionFloat16 =>
      _aiModelsDataSource.interpreterPredictionFloat16;

  @override
  Result<Interpreter, AppException> get interpreterPredictionInt8 =>
      _aiModelsDataSource.interpreterPredictionInt8;

  @override
  Result<Interpreter, AppException> get interpreterTransformFloat16 =>
      _aiModelsDataSource.interpreterTransformFloat16;

  @override
  Result<Interpreter, AppException> get interpreterTransformInt8 =>
      _aiModelsDataSource.interpreterTransformInt8;

  @override
  Future<Result<void, AppException>> loadAiModels() =>
      _aiModelsDataSource.loadAiModels();
}
