import 'package:get/get.dart';
import 'package:mobicar/features/data/providers/favorite_database.dart';
import 'package:mobicar/features/data/repositories/favorite_repository_implementation.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/favorite_controller.dart';

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
