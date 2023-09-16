import 'package:flutter/material.dart';

class CardLogin extends StatelessWidget {
  const CardLogin({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.43,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14), // Borde redondeado
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3), // Cambia la posición de la sombra
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Bienvenido a GymBro',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              'Descubre la mejor forma de entrenar',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Login')),
            ElevatedButton(onPressed: () {}, child: const Text('Register')),
            const Text('Use social media'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mail_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
