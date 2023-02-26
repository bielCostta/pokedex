part of 'details_bloc.dart';

abstract class DetaislState extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class DetailsLoading extends DetaislState {}

class DetailsEmpty extends DetaislState {}

class DetailsLoaded extends DetaislState {
  DetailsLoaded(this.status);
  final List<StatusEntity> status;

  @override
  List<Object> get props => [status];
}
