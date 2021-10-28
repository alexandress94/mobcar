import 'package:get/get.dart';
import 'package:mobicar/core/error/failure.dart';
import 'package:mobicar/features/data/models/year_model.dart';
import 'package:mobicar/features/domain/repositories/year_repository.dart';

class YearController extends GetxController with StateMixin<List<YearModel>> {
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
    change([], status: RxStatus.loading());
    try {
      years.value = await repository.getAll(marchCode, modelCode);

      years.isEmpty
          ? change([], status: RxStatus.empty())
          : change(years, status: RxStatus.success());
    } catch (error) {
      change(years, status: RxStatus.error());
      throw ServerFailure('Erro durante carregamento: $error');
    }
    update(['year']);
  }
}
