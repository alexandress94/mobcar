import 'package:mobicar/futures/data/models/models_model.dart';
import 'package:mobicar/futures/data/providers/models_api_provider.dart';
import 'package:mobicar/futures/domain/repositories/models_repository.dart';

class ModelsRepositoryImplementation implements ModelsRepository {
  final ModelsApiProvider provider;

  ModelsRepositoryImplementation({required this.provider});

  @override
  Future<List<ModelsModel>> getAll(String endpoint) async {
    return await provider.getAll(endpoint);
  }
}
