import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/features/gym_screen/presentation/gym_screen.dart';
import 'package:gymbro/features/home_screen/bloc/gym_bloc.dart';
import 'package:gymbro/features/home_screen/presentation/widgets/gym_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GymBloc()..add(LoadGyms()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const CustomAppBar(title: ''),
        body: BlocBuilder<GymBloc, GymState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const SizedBox(height: 15),
                        const Text(
                          'Gimnasios Disponibles',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        if (state is GymsLoading)
                          const Center(child: CircularProgressIndicator())
                        else if (state is GymsLoaded)
                          for (var gym in state.gyms)
                            GymCard(
                              gym: gym,
                              onTap: (gymUuid) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GymScreen(gymUuid: gym.uuid!),
                                  ),
                                );
                              },
                            )
                        else if (state is GymsError)
                          Center(child: Text(state.message))
                        else
                          const Center(child: Text('Algo salió mal')),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
