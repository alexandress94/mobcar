import 'package:get/get.dart';
import 'package:mobicar/features/data/providers/model_api_provider.dart';
import 'package:mobicar/features/data/repositories/model_repository_implementation.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/model_controller.dart';

class ModelsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModelController>(
      () => ModelController(
        repository: ModelRepositoryImplementation(
          provider: ModelApiProvider(),
        ),
      ),
    );
  }
}
