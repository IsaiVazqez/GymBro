import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/widgets/bottom_navigation_bar/bloc/bloc/navigation_bloc.dart';
import 'package:gymbro/features/plans_screen/presentation/views/plans_screen.dart';
import 'package:gymbro/features/home_screen/presentation/views/home_screen.dart';
import 'package:gymbro/features/qr_screen/presentation/views/qr_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final List<Widget> _children = [
    const HomeScreen(),
    const QRScreen(),
    const SubscribedPlansScreen(),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, int>(
      builder: (context, state) {
        return Scaffold(
          body: _children[state],
          floatingActionButton: ClipOval(
            child: Container(
              color: AppColors.primary500, // Color de fondo del botón
              child: FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<NavigationBloc>(context).add(
                      ShowProfileEvent()); // Reemplazar con el evento adecuado para QR
                },
                child: const Icon(Icons.qr_code),
                backgroundColor: AppColors.primary500,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            color: AppColors.background,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  color: state == 0 ? AppColors.primary500 : Colors.white70,
                  onPressed: () {
                    BlocProvider.of<NavigationBloc>(context)
                        .add(ShowHomeEvent());
                  },
                ),
                const SizedBox(
                    width: 48), // Espacio para el FloatingActionButton
                IconButton(
                  icon: const Icon(Icons.sports_gymnastics),
                  color: state == 2 ? AppColors.primary500 : Colors.white70,
                  onPressed: () {
                    BlocProvider.of<NavigationBloc>(context)
                        .add(ShowSubscribedPlansEvent());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


/* class MainScreen extends StatelessWidget {
  final List<Widget> _children = [
    const HomeScreen(),
    const QRScreen(),
    const SubscribedPlansScreen(),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, int>(
      builder: (context, state) {
        return Scaffold(
          body: _children[state],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(ShowProfileEvent()); // Reemplazar con el evento adecuado para QR
            },
            child: const Icon(Icons.qr_code),
            backgroundColor: AppColors.primary500,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            color: AppColors.background,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  color: state == 0 ? AppColors.primary500 : Colors.white70,
                  onPressed: () {
                    BlocProvider.of<NavigationBloc>(context).add(ShowHomeEvent());
                  },
                ),
                const SizedBox(width: 48), // Espacio para el FloatingActionButton
                IconButton(
                  icon: const Icon(Icons.sports_gymnastics),
                  color: state == 2 ? AppColors.primary500 : Colors.white70,
                  onPressed: () {
                    BlocProvider.of<NavigationBloc>(context).add(ShowSubscribedPlansEvent());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
 */