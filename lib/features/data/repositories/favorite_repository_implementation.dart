import 'package:mobicar/features/data/models/favorite_model.dart';
import 'package:mobicar/features/data/providers/favorite_database.dart';
import 'package:mobicar/features/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImplementation implements FavoriteRepository {
  final FavoriteDatabase database;

  FavoriteRepositoryImplementation({required this.database});

  @override
  Future<int> delete(int id) async {
    return await database.delete(id);
  }

  @override
  Future<int> insert(FavoriteModel model) async {
    return await database.insert(model);
  }

  @override
  Future<List<Map<String, dynamic>>> query() async {
    return await database.query();
  }

  @override
  Future<int> update(FavoriteModel model) async {
    return await database.update(model);
  }
}
