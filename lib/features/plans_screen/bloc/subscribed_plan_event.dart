part of 'subscribed_plan_bloc.dart';

abstract class SubscribedPlansEvent {}

class LoadSubscribedPlansEvent extends SubscribedPlansEvent {}

class RefreshSubscribedPlansEvent extends SubscribedPlansEvent {}
