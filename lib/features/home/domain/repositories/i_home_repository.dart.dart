import 'package:pokedex/features/home/domain/entities/pokemon_entity.dart';

abstract class IHomeRepository {
  Future<PokemonEntity> searchPokemons(int offset, int limit);
}
