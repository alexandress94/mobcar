import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobicar/core/endpoint/fipe_endpoint.dart';
import 'package:mobicar/futures/data/models/march_model.dart';

class MarchApiProvider {  

  Future<List<MarchModel>> getAll() async {
    var endpoint = Uri.parse(FipeEndpoint.fipe('/marcas'));
    final response = await http.get(endpoint);
    try {
      if (response.statusCode == 200) {
        // convertendo json
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((model) => MarchModel.fromJson(model)).toList();
      } else {
        throw Exception('Não foi possível obter requisição.');
      }
    } catch (error) {
      throw Exception('Erro ao obter requisição, log: $error');
    }
  }
}
