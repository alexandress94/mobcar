import 'package:get/get.dart';
import 'package:mobicar/features/data/providers/march_api_provider.dart';
import 'package:mobicar/features/data/repositories/march_repository_implementation.dart';
import 'package:mobicar/features/domain/repositories/march_repository.dart';

import '../controllers/march_controller.dart';

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
