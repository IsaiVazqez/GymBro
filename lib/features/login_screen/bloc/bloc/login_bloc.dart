import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialState()) {
    on<ShowLoginFieldsEvent>(_onShowLoginFieldsEvent);
    on<ShowRegisterFieldsEvent>(_onShowRegisterFieldsEvent);
    on<ShowDefaultViewEvent>(_onShowDefaultViewEvent);
  }

  void _onShowLoginFieldsEvent(
      ShowLoginFieldsEvent event, Emitter<LoginState> emit) {
    emit(ShowFieldsState());
  }

  void _onShowDefaultViewEvent(
      ShowDefaultViewEvent event, Emitter<LoginState> emit) {
    emit(InitialState());
  }

  void _onShowRegisterFieldsEvent(
      ShowRegisterFieldsEvent event, Emitter<LoginState> emit) {
    emit(ShowRegisterFieldsState());
  }
}
