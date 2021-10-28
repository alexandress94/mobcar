import 'package:get/get.dart';
import 'package:mobicar/core/error/failure.dart';
import 'package:mobicar/features/data/models/models_model.dart';
import 'package:mobicar/features/domain/repositories/model_repository.dart';

class ModelController extends GetxController with StateMixin<List<ModelModel>> {
  final ModelRepository repository;
  ModelController({required this.repository});

  RxList<ModelModel> models = <ModelModel>[].obs;
  String _selectedNameModel = "";
  String _selectedCodeModel = "";

  set setNameModel(String name) {
    _selectedNameModel = name;
    update(['model']);
  }

  get getNameModel => _selectedNameModel;

  set setCodeModel(String code) {
    _selectedCodeModel = code;
    update(['model']);
  }

  get getCodeModel => _selectedCodeModel;

  Future<void> getAll(String modelCode) async {
    change([], status: RxStatus.loading());
    try {
      models.value = await repository.getAll(modelCode);
      models.isEmpty
          ? change([], status: RxStatus.empty())
          : change(models, status: RxStatus.success());
    } catch (error) {
      change(models, status: RxStatus.error());
      throw ServerFailure('Erro durante carregamento: $error');
    }
    update(['model']);
  }
}
