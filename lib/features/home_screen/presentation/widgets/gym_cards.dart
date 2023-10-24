import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/models/gym_model.dart';

class GymCard extends StatelessWidget {
  final Gym gym;
  final Function(String) onTap;

  const GymCard({Key? key, required this.gym, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onTap(gym.uuid),
      child: Card(
        color: AppColors.primary500,
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                  vertical: size.height * 0.0002),
              title: Text(gym.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    style: const TextStyle(color: Colors.white),
                    gym.address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    style: const TextStyle(color: Colors.white),
                    gym.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating(double calificacion) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < calificacion ? Icons.star : Icons.star_border,
          color: Colors.white,
        );
      }),
    );
  }
}
