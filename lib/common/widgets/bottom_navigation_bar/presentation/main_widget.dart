import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/widgets/bottom_navigation_bar/bloc/bloc/navigation_bloc.dart';
import 'package:gymbro/features/home_screen/presentation/views/home_screen.dart';
import 'package:gymbro/features/profle_screen/presentation/views/profile_screen.dart';

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
    const ProfileScreen(),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, int>(
      builder: (context, state) {
        return Scaffold(
          body: _children[state],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              BlocProvider.of<NavigationBloc>(context).add(
                index == 0 ? ShowHomeEvent() : ShowProfileEvent(),
              );
            },
          ),
        );
      },
    );
  }
}
