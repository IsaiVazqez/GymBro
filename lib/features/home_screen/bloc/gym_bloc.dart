import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymbro/common/models/gym_model.dart';
import 'package:gymbro/common/models/images_model.dart';
import 'package:gymbro/common/models/plan_model.dart';
import 'package:gymbro/core/api/gym_service.dart';
import 'package:meta/meta.dart';

part 'gym_event.dart';
part 'gym_state.dart';

class GymBloc extends Bloc<GymEvent, GymState> {
  final GymService _gymService;

  GymBloc({GymService? gymService})
      : _gymService = gymService ?? GymService(),
        super(GymsLoading()) {
    on<LoadGyms>(_mapLoadGymsToState);

    on<LoadGymEquipmentEvent>(_mapLoadGymEquipmentToState);
    on<LoadGymPlansEvent>((event, emit) async {
      try {
        final plan = await _gymService.fetchGymPlans(event.gymUuid);
        emit(GymPlansLoaded(
          plan,
        ));
      } catch (error) {
        emit(GymError(error.toString()));
      }
    });
  }

  Future<void> _mapLoadGymEquipmentToState(
      LoadGymEquipmentEvent event, Emitter<GymState> emit) async {
    try {
      emit(GymEquipmentLoading());
      final List<Images> equipment =
          await _gymService.fetchGymEquipment(event.gymUuid);
      emit(GymEquipmentLoaded(equipment));
    } catch (error) {
      emit(GymEquipmentError(error.toString()));
    }
  }

  Future<void> _mapLoadGymsToState(
      LoadGyms event, Emitter<GymState> emit) async {
    try {
      emit(GymsLoading());

      final List<Gym> gyms = await _gymService.fetchGyms();
      emit(GymsLoaded(gyms));
    } catch (error) {
      emit(GymsError(error.toString()));
    }
  }
}
