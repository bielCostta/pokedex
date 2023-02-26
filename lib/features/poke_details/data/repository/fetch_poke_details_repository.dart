import 'package:pokedex/features/poke_details/domain/entity/status_entity.dart';

import '../../domain/repositories/i_poke_details_repository.dart';
import '../datasource/remote/i_poke_details_repository.dart';

class FetchPokeDetailsRepository implements IPokeDetailsRepository {
  FetchPokeDetailsRepository(this._datasource);

  final IPokeDetailsRemoteDatasource _datasource;

  @override
  Future<List<StatusEntity>> pokeDetails(int id) async {
    final result = await _datasource.fetchPokeDetails(id);

    if (result.isNotEmpty) {
      return result.map((element) => StatusEntity.fromJson(element)).toList();
    }
    return [];
  }
}
