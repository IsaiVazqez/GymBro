import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gymbro/common/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      leadingWidth: 150, // Ajusta este valor para hacer el logo más largo
      leading: Padding(
        padding:
            const EdgeInsets.only(left: 8.0), // Espacio a la izquierda del logo
        child: Image.asset(
          'assets/horizsontalLogo.png',
          fit: BoxFit
              .contain, // Usa BoxFit.contain para asegurarte de que todo el logo sea visible
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/usuario.svg',
            width: 24,
            height: 24,
          ),
        ),
      ],
      backgroundColor: AppColors.darkGraySoft,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50); // La altura del AppBar
}
