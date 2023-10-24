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

class GymInitial extends GymState {}

class GymPlansLoaded extends GymState {
  final List<Plan> plans;

  GymPlansLoaded(this.plans);

  @override
  List<Object?> get props => [plans];
}

class GymError extends GymState {
  final String message;

  GymError(this.message);

  @override
  List<Object?> get props => [message];
}
