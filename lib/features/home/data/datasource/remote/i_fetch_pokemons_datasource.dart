abstract class IFetchPokemonsRemoteDatasource {
  Future<Map<String, dynamic>> fetchPokemons(int offset, int limit);
}
