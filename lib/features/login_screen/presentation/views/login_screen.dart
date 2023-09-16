import 'package:flutter/material.dart';
import 'package:gymbro/features/login_screen/presentation/widgets/card_login.dart';
import 'package:gymbro/features/login_screen/presentation/widgets/hexagons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            top: 0,
            bottom: size.height * 0.4, // Deja el 40% de la pantalla en blanco
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black87,
                ),
                child: CustomPaint(
                  painter: HexagonPainter(),
                ),
              ),
            ),
          ),

          Positioned(
            top: 70,
            child: Image.asset('assets/logo.png', height: size.height * 0.27),
          ),
          // Tarjeta en el medio que se extiende más allá del fondo morado
          Positioned(
            top: size.height * 0.40, // 35% desde arriba
            left: 20,
            right: 20,
            child: CardLogin(size: size),
          ),
          Positioned(
              top: size.height * 0.90,
              left: 50,
              child: const Text(
                'Todos los derechos reservados UTM 2023',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
              ))
        ],
      ),
    );
  }
}
