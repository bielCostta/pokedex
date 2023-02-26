part of 'details_bloc.dart';

abstract class DetaislEvent extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class FetchDetailsEvent extends DetaislEvent {
  FetchDetailsEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
