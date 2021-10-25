import 'package:get/get.dart';
import 'package:mobicar/futures/presentation/modules/march/initial_binding.dart';
import 'package:mobicar/futures/presentation/modules/march/initial_page.dart';
import 'package:mobicar/futures/presentation/routes/routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: Routes.MARCH,
      page: () => InitialPages(),
      binding: InitialBinding(),
    ),
  ];
}
