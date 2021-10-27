import 'package:get/get.dart';
import 'package:mobicar/futures/data/providers/favorite_database.dart';
import 'package:mobicar/futures/data/repositories/favorite_repository_implementation.dart';
import 'package:mobicar/futures/presentation/modules/initial/controllers/favorite_controller.dart';

class FavoriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(
      () => FavoriteController(
        repository: FavoriteRepositoryImplementation(
          database: FavoriteDatabase.instance,
        ),
      ),
    );
  }
}
