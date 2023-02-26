import 'package:pokedex/features/poke_details/domain/entity/status_entity.dart';

abstract class IPokeDetailsRepository {
  Future<List<StatusEntity>> pokeDetails(int id);
}
