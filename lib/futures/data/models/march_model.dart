import 'package:mobicar/futures/domain/entities/march_entity.dart';

class MarchModel extends MarchEntity {
  MarchModel({required String name, required String codigo})
      : super(name: name, codigo: codigo);

  factory MarchModel.fromJson(Map<String, dynamic> json) {
    return MarchModel(name: json['nome'], codigo: json['codigo']);
  }

  Map<String, dynamic> toJson() {
    return {'nome': name, 'codigo': codigo};
  }
}
