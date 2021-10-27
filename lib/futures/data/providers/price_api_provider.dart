import 'dart:convert';

import 'package:mobicar/core/endpoint/fipe_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:mobicar/futures/data/models/price_model.dart';

class PriceApiProvider {
  Future<PriceModel> getPrice(
      String marchCode, String modelCode, String yearCode) async {
    var url = Uri.parse(FipeEndpoint.fipe(
        '/marcas/$marchCode/modelos/$modelCode/anos/$yearCode'));

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return PriceModel.fromJson(data);
      } else {
        throw Exception('Não foi possível obter requisição.');
      }
    } catch (error) {
      throw Exception('Erro ao obter requisição, log: $error');
    }
  }
}
