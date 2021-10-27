import 'package:mobicar/features/domain/entities/price_entity.dart';

class PriceModel extends PriceEntity {
  PriceModel({required String price}) : super(price: price);

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      price: json['Valor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Valor': price,
    };
  }
}
