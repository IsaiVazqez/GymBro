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
