import 'package:mobicar/futures/domain/entities/march_entity.dart';

class MarchModel extends MarchEntity {

  MarchModel({
    required String name,
  }) : super(name: name);

  factory MarchModel.fromJson(Map<String, dynamic> json) {

    return MarchModel(
      name:   json['nome'],      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,      
    };
  }
}
