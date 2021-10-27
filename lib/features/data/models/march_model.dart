import 'package:mobicar/features/domain/entities/march_entity.dart';

class MarchModel extends MarchEntity {
  MarchModel({required String name, required String code})
      : super(name: name, code: code);

  factory MarchModel.fromJson(Map<String, dynamic> json) {
    return MarchModel(name: json['nome'], code: json['codigo']);
  }

  Map<String, dynamic> toJson() {
    return {'nome': name, 'codigo': code};
  }
}
