import 'package:mobicar/features/data/models/year_model.dart';

abstract class YearRepository {
  Future<List<YearModel>> getAll(String marchCode, String modelCode);
}
