import 'package:get/get.dart';
import 'package:mobicar/features/presentation/modules/initial/initial_page.dart';


class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () => Get.offAll(InitialPages(), transition: Transition.rightToLeft),
    );
    super.onReady();
  }
}
