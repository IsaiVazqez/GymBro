import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/features/login_screen/bloc/bloc/login_bloc.dart';
import 'package:gymbro/features/login_screen/presentation/views/login_screen.dart';
import 'package:gymbro/features/splash_screen/bloc/splash_bloc.dart';
import 'package:gymbro/features/splash_screen/presentation/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GymBro',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            if (state is SplashLoaded) {
              return const LoginScreen();
            }
            return const SplashScreen();
          },
        ),
      ),
    );
  }
}
