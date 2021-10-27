import 'package:get/get.dart';
import 'package:mobicar/core/error/failure.dart';
import 'package:mobicar/features/data/models/march_model.dart';
import 'package:mobicar/features/domain/repositories/march_repository.dart';

class MarchController extends GetxController {
  final MarchRepository repository;

  MarchController({required this.repository});

  String _selectedNameMach = "";
  String _selectedCodeMach = "";
  RxList<MarchModel> brands = <MarchModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAll();
  }

  set setNameMarch(String name) {
    _selectedNameMach = name;
    update(['march']);
  }

  get getNameMarch => _selectedNameMach;

  set setCodeMarch(String code) {
    _selectedCodeMach = code;
    update(['march']);
  }

  get getCodeMarch => _selectedCodeMach;

  Future<void> getAll() async {
    try {
      brands.value = await repository.getAll();
    } catch (error) {
      throw ServerFailure('Erro durante carregamento: $error');
    }

    update(['march']);
  }
}
