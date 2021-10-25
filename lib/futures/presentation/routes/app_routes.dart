import 'package:get/get.dart';
import 'package:mobicar/futures/presentation/modules/initial/bindings/march_binding.dart';
import 'package:mobicar/futures/presentation/modules/initial/bindings/models_binding.dart';
import 'package:mobicar/futures/presentation/modules/initial/initial_page.dart';
import 'package:mobicar/futures/presentation/routes/routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPages(),
      bindings: [
        MarchBinding(),
        ModelsBinding(),
      ],
    ),
  ];
}
