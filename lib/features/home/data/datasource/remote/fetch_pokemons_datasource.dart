import 'package:dio/dio.dart';
import 'package:pokedex/core/infra/poke_url.dart';

import '../../../../../all_injection.dart';
import '../../../../../core/errors/print_error.dart';
import 'i_fetch_pokemons_datasource.dart';

class FetchPokemonsDatasource implements IFetchPokemonsRemoteDatasource {
  final dio = di<Dio>();

  @override
  Future<Map<String, dynamic>> fetchPokemons(
    int offset,
    int limit,
  ) async {
    try {
      final url = '${PokeURL.baseURL}/pokemon?offset=$offset&limit=$limit';
      final response = await dio.get(url);
      if (response.data != null) {
        return response.data;
      }
      return {};
    } catch (e, s) {
      printError(e, s);
      return {};
    }
  }
}
