import 'package:mobicar/futures/domain/entities/models_entity.dart';

class ModelsModel extends ModelsEntity{
    ModelsModel({
    required String name,
    required String codigo
  }) : super(name: name, codigo: codigo);

  factory ModelsModel.fromJson(Map<String, dynamic> json) {

    return ModelsModel(
      name:   json['nome'],
      codigo: json['codigo']      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'codigo': codigo      
    };
  }
}