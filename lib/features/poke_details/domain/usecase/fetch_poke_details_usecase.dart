import 'package:pokedex/features/poke_details/domain/entity/status_entity.dart';
import 'package:pokedex/features/poke_details/domain/repositories/i_poke_details_repository.dart';

class FetchPokeDetailsUsecase {
  FetchPokeDetailsUsecase(this._repository);

  final IPokeDetailsRepository _repository;

  Future<List<StatusEntity>> call(int id) async {
    final details = await _repository.pokeDetails(id);
    return details;
  }
}
