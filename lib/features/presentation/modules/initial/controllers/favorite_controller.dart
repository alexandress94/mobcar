import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicar/core/error/failure.dart';
import 'package:mobicar/features/data/models/favorite_model.dart';
import 'package:mobicar/features/domain/repositories/favorite_repository.dart';
import 'package:mobicar/features/presentation/modules/initial/controllers/year_controller.dart';
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

  int selectedId = 0;
  final marchTextController = TextEditingController();
  final modelTextController = TextEditingController();
  final priceTextController = TextEditingController();

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
    try {
      await repository.insert(
        FavoriteModel(
          model: _modelsController.getNameModel,
          price: _priceController.priceTextController.text,
          year: _yearController.getNameYear,
          march: _marchController.getNameMarch,
        ),
      );
    } catch (error) {
      throw LocalFailure('Falha ao cadastrar os dados: $error');
    }
    getAll();
  }

  Future<void> updateFavorite() async {
    try {
      FavoriteModel favorite = FavoriteModel(
        id: selectedId,
        march: marchTextController.text,
        model: modelTextController.text,
        price: priceTextController.text,
      );

      await repository.update(favorite);
    } catch (error) {
      throw LocalFailure('Falha ao atualizar os dados: $error');
    }

    getAll();
  }

  Future<void> delete(int id) async {
    
    await repository.delete(id);
    getAll();
  }
}
