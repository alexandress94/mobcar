import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobicar/core/endpoint/fipe_endpoint.dart';
import 'package:mobicar/futures/data/models/models_model.dart';

class ModelsApiProvider {
  Future<List<ModelsModel>> getAll(String endpoint) async {
    
    var url = Uri.parse(FipeEndpoint.fipe('/marcas/$endpoint/modelos'));
    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((value) => ModelsModel.fromJson(value['modelos'])).toList();
      } else {
        throw Exception('Não foi possível obter requisição.');
      }
    } catch (error) {
      throw Exception('Erro ao obter requisição, log: $error');
    }
  }
}
