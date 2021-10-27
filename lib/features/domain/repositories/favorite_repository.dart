import 'package:mobicar/features/data/models/favorite_model.dart';

abstract class FavoriteRepository {
  Future<List<Map<String, dynamic>>> query();

  Future<int> insert(FavoriteModel model);

  Future<int> update(FavoriteModel model);

  Future<int> delete(int id);
}
