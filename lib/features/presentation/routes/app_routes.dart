import 'package:get/get.dart';
import 'package:mobicar/features/presentation/modules/initial/bindings/favorite_biding.dart';
import 'package:mobicar/features/presentation/modules/initial/bindings/march_binding.dart';
import 'package:mobicar/features/presentation/modules/initial/bindings/models_binding.dart';
import 'package:mobicar/features/presentation/modules/initial/bindings/price_binding.dart';
import 'package:mobicar/features/presentation/modules/initial/bindings/year_binding.dart';
import 'package:mobicar/features/presentation/modules/initial/initial_page.dart';
import 'package:mobicar/features/presentation/routes/routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const InitialPages(),
      bindings: [
        MarchBinding(),
        ModelsBinding(),
        YearBinding(),
        PriceBinding(),
        FavoriteBinding(),
      ],
    ),
  ];
}
