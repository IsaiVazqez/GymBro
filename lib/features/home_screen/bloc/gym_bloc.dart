import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymbro/common/models/gym_model.dart';
import 'package:gymbro/core/api/gym_service.dart';
import 'package:meta/meta.dart';

part 'gym_event.dart';
part 'gym_state.dart';

class GymBloc extends Bloc<GymEvent, GymState> {
  GymBloc() : super(GymsLoading()) {
    on<LoadGyms>(_mapLoadGymsToState);
  }

  Future<void> _mapLoadGymsToState(
      LoadGyms event, Emitter<GymState> emit) async {
    try {
      emit(GymsLoading());
      final List<Gym> gyms = await fetchGyms();
      emit(GymsLoaded(gyms));
    } catch (error) {
      emit(GymsError(error.toString()));
    }
  }
}
