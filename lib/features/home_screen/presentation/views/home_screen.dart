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
        appBar: const CustomAppBar(
          title: '',
        ),
        body: BlocBuilder<GymBloc, GymState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case GymsLoading:
                return const Center(child: CircularProgressIndicator());
              case GymsLoaded:
                final gyms = (state as GymsLoaded).gyms;
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  itemCount: gyms.length,
                  itemBuilder: (context, index) {
                    final gym = gyms[index]; // Aquí obtienes el gimnasio actual
                    return GymCard(
                      gym: gym,
                      onTap: (String) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => GymScreen(
                                gymUuid: gym
                                    .uuid), // Aquí usas el UUID del gimnasio actual
                          ),
                        );
                      },
                    );
                  },
                );
              case GymsError:
                return Center(child: Text((state as GymsError).message));
              default:
                return const Center(child: Text('Algo salió mal'));
            }
          },
        ),
      ),
    );
  }
}
