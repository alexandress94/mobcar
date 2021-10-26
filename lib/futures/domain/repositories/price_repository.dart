import 'package:mobicar/futures/data/models/price_model.dart';

abstract class PriceRepository {
  Future<PriceModel> getPrice(
      String marchCode, String modelCode, String yearCode);
}
