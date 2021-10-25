import 'package:mobicar/futures/data/models/models_model.dart';

abstract class ModelsRepository{

  Future<List<ModelsModel>> getAll(String endpoint);
}