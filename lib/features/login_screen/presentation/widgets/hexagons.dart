import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';

class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.background
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;

    const double hexagonRadius = 50.0;
    const double hexagonHeight = 1.5 * hexagonRadius;
    final double hexagonWidth = 3 * hexagonRadius * sqrt(3) / 2;

    for (double y = 0; y < size.height; y += hexagonHeight * 3 / 4) {
      for (double x = 0; x < size.width; x += hexagonWidth) {
        final Offset center = Offset(x, y);
        drawHexagon(canvas, center, hexagonRadius, paint);
      }
    }
  }

  void drawHexagon(Canvas canvas, Offset center, double radius, Paint paint) {
    final Path path = Path();
    for (int i = 0; i < 7; i++) {
      final double x = center.dx + radius * cos(i * 2 * pi / 6 - pi / 6);
      final double y = center.dy + radius * sin(i * 2 * pi / 6 - pi / 6);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
