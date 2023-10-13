import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF111111);
  static const lightGreen = Color(0xFF7CD8B3);
  static const darkGraySoft = Color(0xFF2d2d2d);

  static const primary100 = Color(0xFF93dfc0);
  static const primary200 = Color(0xFF77d6b0);
  static const primary300 = Color(0xFF5ccea1);
  static const primary400 = Color(0xFF41c691);
  static const primary500 = Color(0xFF27be82);
  static const primary600 = Color(0xFF21a671);
  static const primary700 = Color(0xFF1d8f61);
  static const primary800 = Color(0xFF187751);
  static const primary900 = Color(0xFF135f41);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      lightGreen,
      Color(0xFF26BE81)
    ], // Representa '#7CD8B3 0%', '#26BE81 100%'
  );
}
