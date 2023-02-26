import 'package:dio/dio.dart';

import '../../../../../all_injection.dart';
import '../../../../../core/errors/print_error.dart';
import '../../../../../core/infra/poke_url.dart';
import 'i_poke_details_repository.dart';

class FetchPokemonsDatasource implements IPokeDetailsRemoteDatasource {
  final dio = di<Dio>();

  @override
  Future<List<Map<String, dynamic>>> fetchPokeDetails(int id) async {
    try {
      final url = '${PokeURL.pokeDetails}/$id/';
      final response = await dio.get(url);
      if (response.data != null) {
        return List.from(response.data['stats']);
      }
      return [];
    } catch (e, s) {
      printError(e, s);
      return [];
    }
  }
}
