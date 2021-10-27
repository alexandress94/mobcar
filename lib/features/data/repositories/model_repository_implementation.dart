import 'package:mobicar/features/data/models/models_model.dart';
import 'package:mobicar/features/data/providers/model_api_provider.dart';
import 'package:mobicar/features/domain/repositories/model_repository.dart';

class ModelRepositoryImplementation implements ModelRepository {
  final ModelApiProvider provider;

  ModelRepositoryImplementation({required this.provider});

  @override
  Future<List<ModelModel>> getAll(String modelCode) async {
    return await provider.getAll(modelCode);
  }
}
