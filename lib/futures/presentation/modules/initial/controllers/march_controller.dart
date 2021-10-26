import 'package:get/get.dart';
import 'package:mobicar/core/error/failure.dart';
import 'package:mobicar/futures/data/models/march_model.dart';
import 'package:mobicar/futures/domain/repositories/march_repository.dart';

class MarchController extends GetxController {
  final MarchRepository repository;
  MarchController({required this.repository});

  String _marchSelected = "";
  RxList<MarchModel> brands = <MarchModel>[].obs;

  set setMarch(String name ){
    _marchSelected = name;
    update(['march']);
  }

  get getMarch => _marchSelected;

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
