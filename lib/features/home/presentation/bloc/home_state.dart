part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded({required this.pokemons});
  final List<Pokemons> pokemons;

  @override
  List<Object> get props => [pokemons];
}
