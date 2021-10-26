import 'package:get/get.dart';
import 'package:mobicar/core/error/failure.dart';
import 'package:mobicar/futures/data/models/models_model.dart';
import 'package:mobicar/futures/domain/repositories/models_repository.dart';

class ModelsController extends GetxController {
  final ModelsRepository repository;
  ModelsController({required this.repository});

  RxString codigoMarch = "".obs;
  RxList<ModelsModel> models = <ModelsModel>[].obs;
  String _modelSelected = "";

  set setModel(String name){
    _modelSelected = name;
    update(['model']);
  }

  get getModel => _modelSelected;


  // @override
  // void onInit() {
  //   super.onInit();
  //   getAll();
  // }

  Future<void> getAll(String codigo) async {
    try {
      models.value = await repository.getAll(codigo);
    } catch (error) {
      throw Exception('Erro durante carregamento: $error');
    }
  }
}
