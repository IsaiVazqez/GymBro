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

class GymPlansLoading extends GymState {}

class GymPlansError extends GymState {
  final String message;

  const GymPlansError(this.message);

  @override
  List<Object?> get props => [message];
}

class GymInitial extends GymState {}

class GymPlansLoaded extends GymState {
  final Plan plan;

  const GymPlansLoaded(this.plan);

  @override
  List<Object?> get props => [plan];
}

class GymError extends GymState {
  final String message;

  const GymError(this.message);

  @override
  List<Object?> get props => [message];
}

class GymEquipmentLoading extends GymState {}

class GymEquipmentLoaded extends GymState {
  final List<Images> equipment;

  GymEquipmentLoaded(this.equipment);
}

class GymEquipmentError extends GymState {
  final String message;

  GymEquipmentError(this.message);
}
