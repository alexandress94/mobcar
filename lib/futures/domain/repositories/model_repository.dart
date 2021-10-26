import 'package:mobicar/futures/data/models/models_model.dart';

abstract class ModelRepository {
  Future<List<ModelModel>> getAll(String modelCode);
}
