import 'package:get/get.dart';
import 'package:mobicar/futures/data/models/year_model.dart';
import 'package:mobicar/futures/domain/repositories/year_repository.dart';

class YearController extends GetxController {
  final YearRepository repository;

  YearController({required this.repository});

  RxList<YearModel> years = <YearModel>[].obs;
  RxString _selecteYear = "".obs;

  set setYear(String value) {
    _selecteYear.value = value;
    update(['year']);
  }

  get getYear => _selecteYear;

  Future<void> getAll(String marchCode, String modelCode) async {
    try {
      years.value = await repository.getAll(marchCode, modelCode);
    } catch (error) {
      throw Exception('Erro durante carregamento: $error');
    }
    update(['year']);
  }
}
