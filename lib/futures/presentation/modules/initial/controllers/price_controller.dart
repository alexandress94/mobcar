import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobicar/futures/data/models/price_model.dart';
import 'package:mobicar/futures/domain/repositories/price_repository.dart';

class PriceController extends GetxController {
  final priceTextController = TextEditingController();
  final PriceRepository repository;
  PriceController({required this.repository});

  late PriceModel price;

  Future<void> getPrice(
      String marchCode, String modelCode, String yearCode) async {
    try {
      price = await repository.getPrice(marchCode, modelCode, yearCode);
    } catch (error) {
      throw Exception('Erro durante carregamento: $error');
    }
    update(['price']);
  }
}
