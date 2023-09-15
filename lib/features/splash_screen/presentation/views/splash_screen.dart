import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/features/home_screen/presentation/views/home_screen.dart';
import 'package:gymbro/features/splash_screen/bloc/splash_bloc.dart';
import 'package:gymbro/features/splash_screen/bloc/splash_event.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SplashBloc()..add(InitializeSplashScreen()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoaded) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false,
            );
          }
        },
        child: Scaffold(body: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            Widget body;
            switch (state.runtimeType) {
              case SplashInitial:
                body = Center(
                  child: SizedBox(
                    width: size.width * .55, // ajusta el ancho como desees
                    height: size.height * .29, // ajusta la altura como desees
                    child: Image.asset('assets/logo.png', fit: BoxFit.cover),
                  ),
                );

                break;
              case SplashLoaded:
                body = const Center(
                    child: Text('Carga completa, redirigiendo...'));
                break;
              default:
                body = const Center(child: Text('Algo salió mal'));
            }
            return body;
          },
        )),
      ),
    );
  }
}
