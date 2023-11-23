import 'package:bloc/bloc.dart';
import 'package:gymbro/common/models/plan_model.dart';
import 'package:gymbro/core/api/gym_service.dart';

part 'subscribed_plan_event.dart';
part 'subscribed_plan_state.dart';

class SubscribedPlansBloc
    extends Bloc<SubscribedPlansEvent, SubscribedPlansState> {
  final GymService gymService;

  SubscribedPlansBloc(this.gymService) : super(SubscribedPlansInitial()) {
    on<LoadSubscribedPlansEvent>(_onLoadSubscribedPlans);
    on<RefreshSubscribedPlansEvent>(_onRefreshSubscribedPlans);

    add(LoadSubscribedPlansEvent()); // Añadir esto para cargar inicialmente
  }

  void _onLoadSubscribedPlans(LoadSubscribedPlansEvent event,
      Emitter<SubscribedPlansState> emit) async {
    emit(SubscribedPlansLoading());
    try {
      final plans = await gymService.fetchSubscribedPlans();
      emit(SubscribedPlansLoaded(plans: plans));
    } catch (e) {
      emit(SubscribedPlansError(message: e.toString()));
    }
  }

  void _onRefreshSubscribedPlans(RefreshSubscribedPlansEvent event,
      Emitter<SubscribedPlansState> emit) async {
    try {
      final plans = await gymService.fetchSubscribedPlans();
      emit(SubscribedPlansLoaded(plans: plans));
    } catch (e) {
      emit(SubscribedPlansError(message: e.toString()));
    }
  }
}
