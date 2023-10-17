import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: AppColors.primary500),
      ),
      backgroundColor: AppColors.darkGraySoft,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
