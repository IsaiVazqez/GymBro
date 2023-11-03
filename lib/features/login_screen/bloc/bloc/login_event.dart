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

class RegisterSubmitted extends LoginEvent {
  final String email;
  final String phone;
  final String birthdate;
  final String firstName;
  final String lastName;
  final String password;

  RegisterSubmitted({
    required this.email,
    required this.phone,
    required this.birthdate,
    required this.firstName,
    required this.lastName,
    required this.password,
  });
}
