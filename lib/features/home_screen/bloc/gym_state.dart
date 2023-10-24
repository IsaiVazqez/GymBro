part of 'gym_bloc.dart';

abstract class GymState extends Equatable {
  const GymState();

  @override
  List<Object?> get props => [];
}

class GymsLoading extends GymState {}

class GymsLoaded extends GymState {
  final List<Gym> gyms;

  const GymsLoaded(this.gyms);

  @override
  List<Object?> get props => [gyms];
}

class GymsError extends GymState {
  final String message;

  const GymsError(this.message);

  @override
  List<Object?> get props => [message];
}
