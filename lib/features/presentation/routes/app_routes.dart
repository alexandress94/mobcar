import 'package:get/get.dart';
import 'package:mobicar/features/presentation/modules/initial/bindings/connection_network_binding.dart';
import 'package:mobicar/features/presentation/modules/initial/bindings/favorite_biding.dart';
import 'package:mobicar/features/presentation/modules/initial/bindings/march_binding.dart';
import 'package:mobicar/features/presentation/modules/initial/bindings/models_binding.dart';
import 'package:mobicar/features/presentation/modules/initial/bindings/price_binding.dart';
import 'package:mobicar/features/presentation/modules/initial/bindings/year_binding.dart';
import 'package:mobicar/features/presentation/modules/initial/initial_page.dart';
import 'package:mobicar/features/presentation/modules/splash/bindings/splash_binding.dart';
import 'package:mobicar/features/presentation/modules/splash/splash_page.dart';
import 'package:mobicar/features/presentation/routes/routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      bindings: [
        SplashBinding(),
        MarchBinding(),
        ModelsBinding(),
        YearBinding(),
        PriceBinding(),
        FavoriteBinding(),
        ConnectionNetworkBinding(),
      ],
    ),
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPages(),
      bindings: [
        MarchBinding(),
        ModelsBinding(),
        YearBinding(),
        PriceBinding(),
        FavoriteBinding(),
        ConnectionNetworkBinding(),
      ],
    ),
  ];
}
