import 'package:mobicar/features/data/models/models_model.dart';

abstract class ModelRepository {
  Future<List<ModelModel>> getAll(String modelCode);
}
