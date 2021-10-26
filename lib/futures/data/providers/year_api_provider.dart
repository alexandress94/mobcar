import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobicar/core/endpoint/fipe_endpoint.dart';
import 'package:mobicar/futures/data/models/year_model.dart';

class YearApiProvider{

    Future<List<YearModel>> getAll(String marchCode, String modelCode) async {
    var url = Uri.parse(FipeEndpoint.fipe('/marcas/$marchCode/modelos/$modelCode/anos'));

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((models) => YearModel.fromJson(models)).toList();
      } else {
        throw Exception('Não foi possível obter requisição.');
      }
    } catch (error) {
      throw Exception('Erro ao obter requisição, log: $error');
    }
  }
}