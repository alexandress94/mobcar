import 'package:get/get.dart';
import 'package:mobicar/futures/data/providers/march_api_provider.dart';
import 'package:mobicar/futures/data/repositories/march_repository_implementation.dart';
import 'package:mobicar/futures/domain/repositories/march_repository.dart';
import 'package:mobicar/futures/presentation/modules/march/march_controller.dart';

class MarchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarchController>(
      () => MarchController(
        repository: MarchRepositoryImplementation(
          provider: MarchApiProvider(),
        ),
      ),
    );
  }
}
