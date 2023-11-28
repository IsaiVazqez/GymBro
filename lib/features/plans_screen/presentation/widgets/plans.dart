import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/models/subcriptions_model.dart';

class PlanCard extends StatelessWidget {
  final Subcriptions subscription;

  const PlanCard({Key? key, required this.subscription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obteniendo el ancho de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: AppColors.darkGraySoft,
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: AppColors.lightGreen, width: 1),
      ),
      // Haciendo que la tarjeta ocupe todo el ancho de la pantalla
      child: Container(
        width: screenWidth,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subscription.plan!.title ?? 'Nombre del Plan',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subscription.plan!.description ?? 'Descripción del Plan',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Duración: ${subscription.plan!.duration ?? 'No Disponible'} Hora(s)',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Precio: \$${subscription.plan!.price ?? 'No Disponible'}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
