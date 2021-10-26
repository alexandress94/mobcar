import 'package:get/get.dart';
import 'package:mobicar/futures/data/providers/price_api_provider.dart';
import 'package:mobicar/futures/data/repositories/price_repository_implementation.dart';
import 'package:mobicar/futures/presentation/modules/initial/controllers/price_controller.dart';

class PriceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PriceController>(
      () => PriceController(
        repository: PriceRepositoryImplementation(
          provider: PriceApiProvider(),
        ),
      ),
    );
  }
}
