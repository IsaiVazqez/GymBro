import 'package:bloc/bloc.dart';
import 'package:gymbro/core/api/auth_service.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService;

  LoginBloc({AuthService? authService})
      : _authService = authService ?? AuthService(),
        super(InitialState()) {
    on<ShowLoginFieldsEvent>(_onShowLoginFieldsEvent);
    on<LoginEvent>(_onLoginEvent);
    on<ShowRegisterFieldsEvent>(_onShowRegisterFieldsEvent);
    on<ShowDefaultViewEvent>(_onShowDefaultViewEvent);
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }
  void _onRegisterSubmitted(
      RegisterSubmitted event, Emitter<LoginState> emit) async {
    emit(LoadingState());
    try {
      final success = await _authService.register(
        email: event.email,
        phone: event.phone,
        birthdate: event.birthdate,
        firstName: event.firstName,
        lastName: event.lastName,
        password: event.password,
      );

      // Retrasar la emisión del estado de éxito o error
      await Future.delayed(const Duration(seconds: 2), () {
        if (success) {
          emit(RegisterSuccessState());
        } else {
          emit(RegisterErrorState(errorMessage: 'Error en el registro'));
        }
      });
    } catch (error) {
      await Future.delayed(const Duration(seconds: 2), () {
        emit(RegisterErrorState(errorMessage: 'Error en el registro: $error'));
      });
    }
  }

  void _onShowLoginFieldsEvent(
      ShowLoginFieldsEvent event, Emitter<LoginState> emit) {
    emit(ShowFieldsState());
  }

  void _onLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginSubmitted) {
      emit(LoadingState());

      try {
        final success = await _authService.login(event.email, event.password);

        if (success) {
          emit(LoginSuccessState());
        } else {
          emit(LoginErrorState('Error en el inicio de sesión'));
        }
      } catch (error) {
        emit(LoginErrorState('Error en el inicio de sesión: $error'));
      }
    }
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
