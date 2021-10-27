import 'package:mobicar/features/data/models/year_model.dart';
import 'package:mobicar/features/data/providers/year_api_provider.dart';
import 'package:mobicar/features/domain/repositories/year_repository.dart';

class YearRepositoryImplementation implements YearRepository {
  final YearApiProvider provider;

  YearRepositoryImplementation({required this.provider});

  @override
  Future<List<YearModel>> getAll(String marchCode, String modelCode) async {
    return await provider.getAll(marchCode, modelCode);
  }
}
