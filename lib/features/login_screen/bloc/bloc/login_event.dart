part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class ShowLoginFieldsEvent extends LoginEvent {}

class ShowRegisterFieldsEvent extends LoginEvent {}

class ShowDefaultViewEvent extends LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});
}
