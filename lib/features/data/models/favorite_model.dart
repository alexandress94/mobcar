import 'package:mobicar/features/domain/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  FavoriteModel({
    int? id,
    required String march,
    required String model,
    required String price,
    String? year,
  }) : super(
          id: id,
          march: march,
          model: model,
          year: year,
          price: price,
        );

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id_favorite'],
      march: map['ds_march'],
      model: map['ds_model'],
      year: map['nr_year'],
      price: map['nr_price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_favorite': id,
      'ds_march': march,
      'ds_model': model,
      'nr_year': year,
      'nr_price': price,
    };
  }
}
