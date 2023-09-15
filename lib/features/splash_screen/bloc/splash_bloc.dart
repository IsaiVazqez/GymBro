import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/features/splash_screen/bloc/splash_event.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoaded extends SplashState {}

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<InitializeSplashScreen>(_initializeSplashScreen);
  }

  Future<void> _initializeSplashScreen(
      InitializeSplashScreen event, Emitter<SplashState> emit) async {
    emit(SplashInitial());
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashLoaded());
  }
}
