import 'package:pokedex/features/home/presentation/bloc/home_bloc.dart';

import '../../all_injection.dart';
import 'data/datasource/remote/fetch_pokemons_datasource.dart';
import 'data/datasource/remote/i_fetch_pokemons_datasource.dart';
import 'data/repository/fetch_pokemons_repository.dart';
import 'domain/repositories/i_home_repository.dart.dart';
import 'domain/usecase/fetch_pokemons.dart';

Future<void> initHomeDependencies() async {
  di.registerLazySingleton(() => HomeBloc(di<FetchPokemonsUsecase>()));

  di.registerFactory<FetchPokemonsUsecase>(
    () => FetchPokemonsUsecase(di<IHomeRepository>()),
  );

  di.registerFactory<IHomeRepository>(
    () => FetchPokemonsRepository(di<IFetchPokemonsRemoteDatasource>()),
  );

  di.registerFactory<IFetchPokemonsRemoteDatasource>(
    () => FetchPokemonsDatasource(),
  );
}
