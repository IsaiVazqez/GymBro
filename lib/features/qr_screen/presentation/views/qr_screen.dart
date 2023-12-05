import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/features/login_screen/presentation/views/login_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  String userUuid = '';
  bool isTokenPresent = true;

  @override
  void initState() {
    super.initState();
    _loadUserUuid();
  }

  Future<void> _loadUserUuid() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isNotEmpty) {
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      final id = payload['id'] ?? '';
      if (id is String) {
        setState(() {
          userUuid = id;
          isTokenPresent = true; // Establece a true si hay un token
        });
      }
    } else {
      setState(() {
        isTokenPresent = false; // Establece a false si no hay token
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: ''),
      body: Center(
        child: userUuid.isNotEmpty
            ? QrImageView(
                backgroundColor: AppColors.primary500,
                data: userUuid,
                version: QrVersions.auto,
                size: 350.0,
              )
            : isTokenPresent
                ? const CircularProgressIndicator()
                : _buildNoTokenMessage(), // Muestra un mensaje si no hay token
      ),
    );
  }

  Widget _buildNoTokenMessage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.error_outline,
          size: 60,
          color: Colors.red,
        ),
        const SizedBox(height: 16),
        const Text(
          'Necesitas iniciar sesión',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8),
        const Text(
          'Por favor, inicia sesión para ver tu código QR.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.primary500,
          ),
          child: const Text('Inicio de Sesión'),
        ),
      ],
    );
  }
}
