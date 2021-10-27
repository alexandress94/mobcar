import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobicar/core/endpoint/fipe_endpoint.dart';
import 'package:mobicar/features/data/models/models_model.dart';

class ModelApiProvider {
  Future<List<ModelModel>> getAll(String code) async {
    var url = Uri.parse(FipeEndpoint.fipe('/marcas/$code/modelos'));

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> result = data['modelos'];
        return result.map((models) => ModelModel.fromJson(models)).toList();
      } else {
        throw Exception('Não foi possível obter requisição.');
      }
    } catch (error) {
      throw Exception('Erro ao obter requisição, log: $error');
    }
  }
}
