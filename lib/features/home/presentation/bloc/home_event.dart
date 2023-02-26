part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class FetchPokemons extends HomeEvent {}

class NextPokemons extends HomeEvent {}
