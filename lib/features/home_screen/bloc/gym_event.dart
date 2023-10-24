part of 'gym_bloc.dart';

@immutable
abstract class GymEvent extends Equatable {
  const GymEvent();
}

class LoadGyms extends GymEvent {
  @override
  List<Object?> get props => [];
}
