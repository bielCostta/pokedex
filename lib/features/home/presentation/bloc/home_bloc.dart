import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/errors/print_error.dart';
import 'package:pokedex/features/home/domain/entities/pokemon_entity.dart';

import '../../domain/usecase/fetch_pokemons.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchPokemonsUsecase _fetchPokemons;

  HomeBloc(this._fetchPokemons) : super(HomeLoading()) {
    Set<Pokemons> pokemons = {};
    int position = 0;
    int limit = 10;
    on<HomeEvent>((event, emit) async {
      try {
        switch (event.runtimeType) {
          case FetchPokemons:
            final result = await _fetchPokemons(0, 10);
            if (result?.results != null) {
              pokemons
                ..clear()
                ..addAll(result!.results!);
              emit(HomeLoaded(pokemons: pokemons.toList()));
            }
            break;

          case NextPokemons:
            position = position + 10;
            final result = await _fetchPokemons(
              position,
              limit,
            );

            if (result?.results != null) {
              pokemons.addAll(result!.results!);
              emit(HomeLoaded(pokemons: pokemons.toList()));
            }
            break;
        }
      } catch (e, s) {
        printError(e, s);
      }
    });
  }
}
