import 'package:get/get.dart';
import 'package:mobicar/features/data/providers/year_api_provider.dart';
import 'package:mobicar/features/data/repositories/year_repository_implementation.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/year_controller.dart';

class YearBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YearController>(
      () => YearController(
        repository: YearRepositoryImplementation(
          provider: YearApiProvider(),
        ),
      ),
    );
  }
}
