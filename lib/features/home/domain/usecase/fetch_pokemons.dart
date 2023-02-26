import 'package:pokedex/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/home/domain/repositories/i_home_repository.dart.dart';

class FetchPokemonsUsecase {
  FetchPokemonsUsecase(this._repository);

  final IHomeRepository _repository;

  Future<PokemonEntity>? call(int offset, int limit) async {
    final pokemons = await _repository.searchPokemons(offset, limit);

    return pokemons;
  }
}
