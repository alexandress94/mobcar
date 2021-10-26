import 'package:get/get.dart';
import 'package:mobicar/futures/data/models/models_model.dart';
import 'package:mobicar/futures/domain/repositories/model_repository.dart';

class ModelController extends GetxController {
  final ModelRepository repository;
  ModelController({required this.repository});

  RxList<ModelModel> models = <ModelModel>[].obs;
  String _modelSelected = "";

  set setModel(String name) {
    _modelSelected = name;
    update(['model']);
  }

  get getModel => _modelSelected;

  Future<void> getAll(String modelCode) async {
    try {
      models.value = await repository.getAll(modelCode);
    } catch (error) {
      throw Exception('Erro durante carregamento: $error');
    }
    update(['model']);
  }
}
