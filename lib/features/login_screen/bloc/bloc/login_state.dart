part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class InitialState extends LoginState {}

class ShowFieldsState extends LoginState {}

class ShowRegisterFieldsState extends LoginState {}

class LoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}

class RegisterSuccessState extends LoginState {
  final String registrationMessage;

  RegisterSuccessState(
      {this.registrationMessage = 'Account creaded successfully'});
}

class RegisterErrorState extends LoginState {
  final String errorMessage;

  RegisterErrorState({this.errorMessage = 'Error en el registro.'});
}
