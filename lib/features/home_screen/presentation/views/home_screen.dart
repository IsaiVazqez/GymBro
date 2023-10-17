import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/models/gym_model.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/features/home_screen/presentation/widgets/gym_cards.dart';

final List<Map<String, dynamic>> gymData = [
  {
    "Id": "1",
    "Nombre": "Gym A",
    "Calificacion": "5.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "2",
    "Nombre": "Gym B",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "3",
    "Nombre": "Gym C",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "4",
    "Nombre": "Gym D",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "5",
    "Nombre": "Gym E",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "6",
    "Nombre": "Gym F",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "7",
    "Nombre": "Gym G",
    "Calificacion": "3.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "8",
    "Nombre": "Gym H",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "9",
    "Nombre": "Gym I",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "10",
    "Nombre": "Gym J",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "11",
    "Nombre": "Gym K",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "12",
    "Nombre": "Gym L",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "13",
    "Nombre": "Gym M",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "14",
    "Nombre": "Gym N",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  },
  {
    "Id": "15",
    "Nombre": "Gym O",
    "Calificacion": "2.0",
    "Direccion": "Calle 59 por 103 y 40 Altabrisa",
    "Descripcion":
        "Este gimnasio provee mucha informacion al respecto lorem impsun"
  }
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gyms = Gym.fromJson(gymData);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Gimnasios Disponibles'),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemCount: gyms.length,
        itemBuilder: (context, index) => GymCard(gym: gyms[index]),
      ),
    );
  }
}
