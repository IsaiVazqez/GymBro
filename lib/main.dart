import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/widgets/bottom_navigation_bar/bloc/bloc/navigation_bloc.dart';
import 'package:gymbro/common/widgets/bottom_navigation_bar/presentation/main_widget.dart';
import 'package:gymbro/features/home_screen/bloc/gym_bloc.dart';
import 'package:gymbro/features/login_screen/bloc/bloc/login_bloc.dart';
import 'package:gymbro/features/login_screen/presentation/views/login_screen.dart';
import 'package:gymbro/features/splash_screen/bloc/splash_bloc.dart';
import 'package:gymbro/features/splash_screen/bloc/splash_event.dart';
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
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<SplashBloc>(
            create: (context) => SplashBloc()..add(InitializeSplashScreen())),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        BlocProvider<GymBloc>(create: (context) => GymBloc()..add(LoadGyms())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GymBro',
        theme: ThemeData(useMaterial3: true),
        home: const MyAppNavigator(),
      ),
    );
  }
}

class MyAppNavigator extends StatelessWidget {
  const MyAppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        } else if (state is SplashUnauthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      },
      builder: (context, state) {
        if (state is SplashLoading) {
          return const SplashScreen();
        }
        return Container();
      },
    );
  }
}
