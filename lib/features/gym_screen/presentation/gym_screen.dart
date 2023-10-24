import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/models/gym_model.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';

class GymScreen extends StatelessWidget {
  final Gym gym;

  const GymScreen({Key? key, required this.gym}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGraySoft,
      appBar: CustomAppBar(title: gym.name), // Utiliza tu CustomAppBar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dirección: ${gym.address}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Descripción: ${gym.description}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            // Agrega más campos según lo necesites
          ],
        ),
      ),
    );
  }
}
