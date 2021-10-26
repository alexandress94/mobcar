import 'package:get/get.dart';
import 'package:mobicar/futures/data/models/year_model.dart';
import 'package:mobicar/futures/domain/repositories/year_repository.dart';

class YearController extends GetxController {
  final YearRepository repository;

  YearController({required this.repository});

  RxList<YearModel> years = <YearModel>[].obs;
  RxString _modelCode = "".obs;
  RxString selectedCode = "".obs;

  set setYear(String value) {
    selectedCode.value = value;
    update(['year']);
  }

  get getYear => _modelCode;

  Future<void> getAll(String marchCode, String modelCode) async {
    try {
      years.value = await repository.getAll(marchCode, modelCode);
    } catch (error) {
      throw Exception('Erro durante carregamento: $error');
    }
    update(['year']);
  }
}
