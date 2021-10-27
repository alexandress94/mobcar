import 'package:mobicar/features/data/models/march_model.dart';
import 'package:mobicar/features/data/providers/march_api_provider.dart';
import 'package:mobicar/features/domain/repositories/march_repository.dart';

class MarchRepositoryImplementation implements MarchRepository {
  final MarchApiProvider provider;

  MarchRepositoryImplementation({required this.provider});

  @override
  Future<List<MarchModel>> getAll() async {
    return await provider.getAll();
  }
}
