import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, int> {
  NavigationBloc() : super(0) {
    on<ShowHomeEvent>((event, emit) => emit(0));
    on<ShowProfileEvent>((event, emit) => emit(1));
    on<ShowSubscribedPlansEvent>((event, emit) => emit(2));
  }
}
