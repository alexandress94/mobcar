import 'package:get/get.dart';
import 'package:mobicar/core/error/failure.dart';
import 'package:mobicar/futures/data/models/march_model.dart';
import 'package:mobicar/futures/domain/repositories/march_repository.dart';

class MarchController extends GetxController with StateMixin<List<MarchModel>>{
  final MarchRepository repository;
  MarchController({required this.repository});

  RxList<MarchModel> brands = <MarchModel>[].obs;

  @override
  void onInit(){
    super.onInit();
    getAll();
  }

  Future<void> getAll() async {
    change([], status: RxStatus.loading());    
    try{
      brands.value = await repository.getAll();
      change(brands, status: RxStatus.success());
    }catch (error){
      change(brands, status: RxStatus.error());
      throw ServerFailure('Erro durante carregamento: $error');
    }
  }
}