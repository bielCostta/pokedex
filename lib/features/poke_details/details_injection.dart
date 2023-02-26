import 'package:pokedex/features/poke_details/data/datasource/remote/poke_details_remote_datasource.dart';
import 'package:pokedex/features/poke_details/presentation/bloc/details_bloc.dart';

import '../../all_injection.dart';
import 'data/datasource/remote/i_poke_details_repository.dart';
import 'data/repository/fetch_poke_details_repository.dart';
import 'domain/repositories/i_poke_details_repository.dart';
import 'domain/usecase/fetch_poke_details_usecase.dart';

Future<void> initDetailsDependencies() async {
  di.registerLazySingleton(() => DetailsBloc(di<FetchPokeDetailsUsecase>()));

  di.registerFactory<FetchPokeDetailsUsecase>(
    () => FetchPokeDetailsUsecase(di<IPokeDetailsRepository>()),
  );

  di.registerFactory<IPokeDetailsRepository>(
    () => FetchPokeDetailsRepository(
      di<IPokeDetailsRemoteDatasource>(),
    ),
  );

  di.registerFactory<IPokeDetailsRemoteDatasource>(
    () => FetchPokemonsDatasource(),
  );
}
