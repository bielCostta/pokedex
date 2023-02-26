import 'package:pokedex/features/home/data/datasource/remote/i_fetch_pokemons_datasource.dart';
import 'package:pokedex/features/home/domain/entities/pokemon_entity.dart';

import '../../../../core/errors/print_error.dart';
import '../../domain/repositories/i_home_repository.dart.dart';

class FetchPokemonsRepository implements IHomeRepository {
  FetchPokemonsRepository(this._datasource);

  final IFetchPokemonsRemoteDatasource _datasource;

  @override
  Future<PokemonEntity> searchPokemons(int offset, int limit) async {
    try {
      final response = await _datasource.fetchPokemons(offset, limit);

      if (response.isNotEmpty) {
        return PokemonEntity.fromJson(response);
      }
      return const PokemonEntity(
        count: 0,
      );
    } catch (e, s) {
      printError(e, s);
      return const PokemonEntity(
        count: 0,
      );
    }
  }
}
