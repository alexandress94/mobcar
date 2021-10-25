import 'package:mobicar/futures/data/models/march_model.dart';

abstract class MarchRepository {

  Future<List<MarchModel>> getAll();
}