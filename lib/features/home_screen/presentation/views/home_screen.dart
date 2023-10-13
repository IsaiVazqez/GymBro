import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/models/gym_model.dart';
import 'package:gymbro/features/home_screen/presentation/widgets/gym_cards.dart';

final List<Map<String, dynamic>> gymData = [
  {
    "id": "1",
    "Nombre": "Gym 1",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "2",
    "Nombre": "Gym 2",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "3",
    "Nombre": "Gym 3",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "4",
    "Nombre": "Gym 4",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "5",
    "Nombre": "Gym 5",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "6",
    "Nombre": "Gym 6",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "7",
    "Nombre": "Gym 7",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "8",
    "Nombre": "Gym 8",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "9",
    "Nombre": "Gym 9",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "10",
    "Nombre": "Gym 10",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "11",
    "Nombre": "Gym 11",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "12",
    "Nombre": "Gym 12",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "13",
    "Nombre": "Gym 13",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "14",
    "Nombre": "Gym 14",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  },
  {
    "id": "15",
    "Nombre": "Gym 15",
    "Imagen": "https://loremflickr.com/320/240",
    "Dirección": "Calle 30 por 103 y 10"
  }
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gyms = Gym.fromJson(gymData);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.darkGraySoft,
        title: const Text(
          'Gimnasios disponibles',
          style: TextStyle(color: AppColors.primary500),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemCount: gyms.length,
        itemBuilder: (context, index) => GymCard(gym: gyms[index]),
      ),
    );
  }
}
