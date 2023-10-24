import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      leadingWidth: 100, // Ajusta este valor según sea necesario
      leading: Padding(
        padding: const EdgeInsets.only(
            right: 1.0, left: 6.0), // Espacio a la derecha del logo
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/horizsontalLogo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Padding(
        padding:
            const EdgeInsets.only(left: 0), // Espacio a la izquierda del título
        child: Text(
          title,
          style: const TextStyle(color: AppColors.primary500),
        ),
      ),
      backgroundColor: AppColors.darkGraySoft,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50); // La altura del AppBar
}
