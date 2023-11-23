import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/core/api/gym_service.dart';
import 'package:gymbro/features/plans_screen/bloc/subscribed_plan_bloc.dart';
import 'package:gymbro/features/plans_screen/presentation/widgets/plans.dart';

class SubscribedPlansScreen extends StatelessWidget {
  const SubscribedPlansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubscribedPlansBloc(GymService()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const CustomAppBar(title: 'Mis Planes Suscritos'),
        body: RefreshIndicator(
          onRefresh: () async {
            context
                .read<SubscribedPlansBloc>()
                .add(RefreshSubscribedPlansEvent());
          },
          child: BlocBuilder<SubscribedPlansBloc, SubscribedPlansState>(
            builder: (context, state) {
              if (state is SubscribedPlansLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SubscribedPlansLoaded) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: state.plans
                          .map((plan) => PlansCard(plan: plan))
                          .toList(),
                    ),
                  ),
                );
              } else if (state is SubscribedPlansError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return const Center(
                child: Text(
                  'No estás suscrito a ningún plan.',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
