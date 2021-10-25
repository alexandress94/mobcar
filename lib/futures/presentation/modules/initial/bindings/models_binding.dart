import 'package:get/get.dart';
import 'package:mobicar/futures/data/providers/models_api_provider.dart';
import 'package:mobicar/futures/data/repositories/models_repository_implementation.dart';
import 'package:mobicar/futures/presentation/modules/initial/controllers/models_controller.dart';

class ModelsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModelsController>(
      () => ModelsController(
        repository: ModelsRepositoryImplementation(
          provider: ModelsApiProvider(),
        ),
      ),
    );
  }
}