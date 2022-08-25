import 'dart:convert';

import 'viacep_repository.dart';

class ViaCepSearch {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String unidade;
  final String ibge;
  final String gia;

  ViaCepSearch({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.unidade,
    required this.ibge,
    required this.gia,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'cep': cep});
    result.addAll({'logradouro': logradouro});
    result.addAll({'complemento': complemento});
    result.addAll({'bairro': bairro});
    result.addAll({'localidade': localidade});
    result.addAll({'uf': uf});
    result.addAll({'unidade': unidade});
    result.addAll({'ibge': ibge});
    result.addAll({'gia': gia});

    return result;
  }

  factory ViaCepSearch.fromMap(Map<String, dynamic> map) {
    return ViaCepSearch(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      complemento: map['complemento'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
      unidade: map['unidade'] ?? '',
      ibge: map['ibge'] ?? '',
      gia: map['gia'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ViaCepSearch.fromJson(String source) =>
      ViaCepSearch.fromMap(json.decode(source));

  static Future<ViaCepSearch> getInstance(String cep) async {
    return ViaCepRepository().getViacep(cep);
  }
}
