part of 'gym_bloc.dart';

@immutable
abstract class GymEvent extends Equatable {
  const GymEvent();
  @override
  List<Object?> get props => [];
}

class LoadGyms extends GymEvent {
  @override
  List<Object?> get props => [];
}

class LoadGymPlansEvent extends GymEvent {
  final String gymUuid;

  const LoadGymPlansEvent(this.gymUuid);

  @override
  List<Object?> get props => [gymUuid];
}
