part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

class ShowHomeEvent extends NavigationEvent {}

class ShowProfileEvent extends NavigationEvent {}
