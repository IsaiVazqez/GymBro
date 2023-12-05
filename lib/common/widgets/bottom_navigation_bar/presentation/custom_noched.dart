import 'package:flutter/material.dart';

class CircularNotchClipper extends CustomClipper<Path> {
  final double radius;
  final double notchMargin;

  CircularNotchClipper({this.radius = 28, this.notchMargin = 8});

  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double start = (size.width / 2) - radius - notchMargin;
    final double end = (size.width / 2) + radius + notchMargin;

    path.lineTo(start, 0);
    path.arcToPoint(
      Offset(end, 0),
      radius: Radius.circular(radius + notchMargin),
      clockwise: false,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CircularNotchClipper oldClipper) => true;
}
