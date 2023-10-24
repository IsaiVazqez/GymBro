import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/models/gym_model.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/features/home_screen/bloc/gym_bloc.dart';

class GymScreen extends StatelessWidget {
  final String gymUuid;

  const GymScreen({Key? key, required this.gymUuid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GymBloc>().add(LoadGymPlansEvent(gymUuid));

    return BlocBuilder<GymBloc, GymState>(builder: (context, state) {
      if (state is GymPlansLoaded) {
        final plan = state.plans.firstWhereOrNull((p) => p.gym.uuid == gymUuid);
        if (plan != null) {
          return Scaffold(
            backgroundColor: AppColors.darkGraySoft,
            appBar: const CustomAppBar(title: ""), // Utiliza tu CustomAppBar
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dirección: ${plan.gym.address}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text('Descripción: ${plan.gym.description}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: plan.plans.length,
                      itemBuilder: (context, index) {
                        final planElement = plan.plans[index];
                        return Card(
                          child: ListTile(
                            title: Text(planElement.title),
                            subtitle: Text(planElement.description),
                            trailing: Text('\$${planElement.price}'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
