import 'package:dio/dio.dart';

import 'viacep_search.dart';

class ViaCepRepository {
  final base = "https://viacep.com.br/ws";

  Future<ViaCepSearch> getViacep(String cep) async {
    final response = await Dio().get("$base/$cep/json/");
    return ViaCepSearch.fromMap(response.data);
  }
}
