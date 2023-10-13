import 'package:flutter/material.dart';
import 'package:gymbro/common/models/gym_model.dart';

class GymCard extends StatelessWidget {
  final Gym gym;

  const GymCard({Key? key, required this.gym}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              gym.imagen,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04, vertical: size.height * 0.0002),
            title: Text(gym.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(gym.direccion),
          )
        ],
      ),
    );
  }
}
