import 'package:get/get.dart';
import 'package:mobicar/core/error/failure.dart';
import 'package:mobicar/futures/data/models/models_model.dart';
import 'package:mobicar/futures/domain/repositories/model_repository.dart';

class ModelController extends GetxController {
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
    try {
      models.value = await repository.getAll(modelCode);
    } catch (error) {
      throw ServerFailure('Erro durante carregamento: $error');
    }
    update(['model']);
  }
}
