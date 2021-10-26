import 'dart:convert';

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

  factory ModelsModel.fromMap(String source) => ModelsModel.fromJson(json.decode(source));

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'codigo': codigo      
    };
  }

}