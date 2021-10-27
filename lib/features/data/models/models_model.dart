import 'dart:convert';

import 'package:mobicar/features/domain/entities/model_entity.dart';

class ModelModel extends ModelEntity {
  ModelModel({required String name, required String code})
      : super(name: name, code: code);

  factory ModelModel.fromJson(Map<String, dynamic> json) {
    return ModelModel(
      name: json['nome'],
      code: json['codigo'].toString(),
    );
  }

  factory ModelModel.fromMap(String source) =>
      ModelModel.fromJson(json.decode(source));

  Map<String, dynamic> toJson() {
    return {'nome': name, 'codigo': code};
  }
}
