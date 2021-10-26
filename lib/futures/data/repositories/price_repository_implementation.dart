import 'package:mobicar/futures/data/models/price_model.dart';
import 'package:mobicar/futures/data/providers/price_api_provider.dart';
import 'package:mobicar/futures/domain/repositories/price_repository.dart';

class PriceRepositoryImplementation implements PriceRepository {
  final PriceApiProvider provider;

  PriceRepositoryImplementation({required this.provider});

  @override
  Future<PriceModel> getPrice(
      String marchCode, String modelCode, String yearCode) async {
    return await provider.getPrice(marchCode, modelCode, yearCode);
  }
}
