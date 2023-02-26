import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/errors/print_error.dart';
import 'package:pokedex/features/poke_details/domain/entity/status_entity.dart';

import '../../domain/usecase/fetch_poke_details_usecase.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetaislEvent, DetaislState> {
  final FetchPokeDetailsUsecase _fetchDetails;

  DetailsBloc(this._fetchDetails) : super(DetailsLoading()) {
    on<DetaislEvent>((event, emit) async {
      try {
        switch (event.runtimeType) {
          case FetchDetailsEvent:
            emit(DetailsLoading());
            final result = await _fetchDetails((event as FetchDetailsEvent).id);
            if (result.isNotEmpty) {
              emit(DetailsLoaded(result));
            } else {
              emit(DetailsEmpty());
            }

            break;
          default:
        }
      } catch (e, s) {
        printError(e, s);
      }
    });
  }
}
