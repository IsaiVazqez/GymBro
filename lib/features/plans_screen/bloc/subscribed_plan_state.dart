part of 'subscribed_plan_bloc.dart';

abstract class SubscribedPlansState {}

class SubscribedPlansInitial extends SubscribedPlansState {}

class SubscribedPlansLoading extends SubscribedPlansState {}

class SubscribedPlansLoaded extends SubscribedPlansState {
  final List<PlanElement> plans;
  SubscribedPlansLoaded({required this.plans});
}

class SubscribedPlansError extends SubscribedPlansState {
  final String message;
  SubscribedPlansError({required this.message});
}
