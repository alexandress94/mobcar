import 'package:get/get.dart';
import 'package:mobicar/futures/data/providers/march_api_provider.dart';
import 'package:mobicar/futures/data/repositories/march_repository_implementation.dart';
import 'package:mobicar/futures/domain/repositories/march_repository.dart';
import 'package:mobicar/futures/presentation/modules/march/initial_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(
      () => InitialController(
        repository: MarchRepositoryImplementation(
          provider: MarchApiProvider(),
        ),
      ),
    );
  }
}
