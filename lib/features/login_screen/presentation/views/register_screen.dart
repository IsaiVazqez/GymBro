import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background, // <- Color de fondo
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.primary500,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _RegisterCard(size: size),
          ),
        ),
      ),
    );
  }
}

class _RegisterCard extends StatelessWidget {
  final Size size;

  const _RegisterCard({required this.size});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary500,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text("Crear cuenta",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
            const SizedBox(height: 20),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: AppColors.background,
                filled: true,
                labelText: "Nombre completo",
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: AppColors.background,
                filled: true,
                labelText: "Correo electrónico",
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                fillColor: AppColors.background,
                filled: true,
                labelText: "Número telefónico",
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                fillColor: AppColors.background,
                filled: true,
                labelText: "Fecha de nacimiento",
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: AppColors.background,
                filled: true,
                labelText: "Contraseña",
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: AppColors.background,
                filled: true,
                labelText: "Confirmar contraseña",
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(fontSize: 15),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.background),
              ),
              onPressed: () {
                // Lógica de registro
              },
              child: const Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customTextField(String label,
      {bool obscureText = false, TextInputType? keyboardType}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        fillColor: AppColors.background,
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.background, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.background, width: 1.0),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
    );
  }
}
