import 'package:get/get.dart';
import 'package:mobicar/core/error/failure.dart';
import 'package:mobicar/futures/data/models/favorite_model.dart';
import 'package:mobicar/futures/domain/repositories/favorite_repository.dart';
import 'package:mobicar/futures/presentation/modules/initial/controllers/year_controller.dart';

import 'march_controller.dart';
import 'model_controller.dart';
import 'price_controller.dart';

class FavoriteController extends GetxController
    with StateMixin<List<FavoriteModel>> {
  final FavoriteRepository repository;

  final _marchController = Get.find<MarchController>();
  final _modelsController = Get.find<ModelController>();
  final _yearController = Get.find<YearController>();
  final _priceController = Get.find<PriceController>();

  FavoriteController({required this.repository});
  RxList<FavoriteModel> _favoriteModels = <FavoriteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAll();
  }

  Future<void> getAll() async {
    change([], status: RxStatus.loading());

    try {
      List<Map<String, dynamic>> response = await repository.query();

      _favoriteModels.value =
          response.map((data) => FavoriteModel.fromMap(data)).toList();

      _favoriteModels.isEmpty
          ? change([], status: RxStatus.empty())
          : change(_favoriteModels, status: RxStatus.success());
          
    } catch (error) {
      change(_favoriteModels, status: RxStatus.error());
      throw LocalFailure('Falha ao obter registro no banco de dados $error');
    }
  }

  Future<void> insert() async {
    await repository.insert(
      FavoriteModel(
        model: _modelsController.getNameModel,
        price: _priceController.priceTextController.text,
        year: _yearController.getNameYear,
        march: _marchController.getNameMarch,
      ),
    );
    getAll();
  }
}
