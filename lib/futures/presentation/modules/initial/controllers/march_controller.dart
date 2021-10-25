import 'package:get/get.dart';
import 'package:mobicar/core/error/failure.dart';
import 'package:mobicar/futures/data/models/march_model.dart';
import 'package:mobicar/futures/domain/repositories/march_repository.dart';

class MarchController extends GetxController {
  final MarchRepository repository;
  MarchController({required this.repository});

  RxString selected = "Acura".obs;
  RxList<MarchModel> brands = <MarchModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAll();
  }

  Future<void> getAll() async {
    try {
      brands.value = await repository.getAll();
    } catch (error) {
      throw ServerFailure('Erro durante carregamento: $error');
    }
  }
}
