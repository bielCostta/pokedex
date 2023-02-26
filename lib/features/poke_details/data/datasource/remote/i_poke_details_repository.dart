abstract class IPokeDetailsRemoteDatasource {
  Future<List<Map<String, dynamic>>> fetchPokeDetails(int id);
}
