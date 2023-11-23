import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/widgets/bottom_navigation_bar/bloc/bloc/navigation_bloc.dart';
import 'package:gymbro/features/plans_screen/presentation/views/plans_screen.dart';
import 'package:gymbro/features/home_screen/presentation/views/home_screen.dart';
import 'package:gymbro/features/profile_screen/presentation/presentation/views/profile_screen.dart';

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
    const SubscribedPlansScreen(),
    const ProfileScreen(),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, int>(
      builder: (context, state) {
        return Scaffold(
          body: _children[state],
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.primary500, width: 1.0),
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.background,
              selectedItemColor: AppColors.primary500,
              unselectedItemColor: Colors.white70,
              currentIndex: state,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_gymnastics),
                  label: 'Mis Planes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Perfil',
                ),
              ],
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavigationBloc>(context).add(ShowHomeEvent());
                } else if (index == 1) {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(ShowProfileEvent());
                } else if (index == 2) {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(ShowSubscribedPlansEvent());
                }
              },
            ),
          ),
        );
      },
    );
  }
}
