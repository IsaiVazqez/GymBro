import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/features/login_screen/presentation/views/login_screen.dart';
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
            Navigator.of(context).pushReplacement(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const LoginScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                }));
          }
        },
        child: Scaffold(
            backgroundColor: AppColors.background,
            body: BlocBuilder<SplashBloc, SplashState>(
              builder: (context, state) {
                Widget body;
                switch (state.runtimeType) {
                  case SplashLoading:
                    body = Center(
                      child: FadeIn(
                        child: SizedBox(
                          width: size.width * .55,
                          height: size.height * .29,
                          child:
                              Image.asset('assets/logo.png', fit: BoxFit.cover),
                        ),
                      ),
                    );

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
