import 'package:get/get.dart';
import 'package:mobicar/core/error/failure.dart';
import 'package:mobicar/features/data/models/year_model.dart';
import 'package:mobicar/features/domain/repositories/year_repository.dart';

class YearController extends GetxController {
  final YearRepository repository;

  YearController({required this.repository});

  RxList<YearModel> years = <YearModel>[].obs;
  String _selectedNameYear = "";
  String _selectedCodeYear = "";

  set setNameYear(String name) {
    _selectedNameYear = name;
    update(['year']);
  }

  get getNameYear => _selectedNameYear;

  set setCodeYear(String code) {
    _selectedCodeYear = code;
    update(['year']);
  }

  get getCodeYear => _selectedCodeYear;

  Future<void> getAll(String marchCode, String modelCode) async {
    try {
      years.value = await repository.getAll(marchCode, modelCode);
    } catch (error) {
      throw ServerFailure('Erro durante carregamento: $error');
    }
    update(['year']);
  }
}
