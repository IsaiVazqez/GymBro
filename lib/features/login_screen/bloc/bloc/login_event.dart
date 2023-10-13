part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class ShowLoginFieldsEvent extends LoginEvent {}

class ShowDefaultViewEvent extends LoginEvent {}

class ShowRegisterFieldsEvent extends LoginEvent {}
