import 'package:flutter_test/flutter_test.dart';
import 'package:via_cep_brasil/via_cep_brasil.dart';

void main() {
  test('Deve retornar um ViaCepSearch', () async {
    final viacepSearch = await ViaCepSearch.searchCep("69005180");
    expect(viacepSearch, isA<ViaCepSearch>());
  });

  
  test('Deve retornar um Exception caso o cep seja inválido', () async {
    try {
      await ViaCepSearch.searchCep("abcd");
    } on Exception catch (error) {
      expect(error, isA<Exception>());
      expect(error.toString(), matches("O CEP é inválido"));
    }
  });
}
