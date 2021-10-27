import 'package:mobicar/features/domain/entities/year_entity.dart';

class YearModel extends YearEntity {
  YearModel({
    required name,
    required code,
  }) : super(name: name, code: code);

  factory YearModel.fromJson(Map<String, dynamic> json) {
    return YearModel(
      name: json['nome'],
      code: json['codigo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'codigo': code,
    };
  }
}
