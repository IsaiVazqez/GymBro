import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
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

  _RegisterCard({required this.size});

  final TextEditingController _dateController = TextEditingController();

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
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: AppColors.background,
                filled: true,
                labelText: "Nombre completo",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: AppColors.background,
                filled: true,
                labelText: "Correo electrónico",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                fillColor: AppColors.background,
                filled: true,
                labelText: "Número telefónico",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              readOnly:
                  true, // El usuario no puede ingresar la fecha manualmente
              controller: _dateController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: AppColors.background,
                filled: true,
                labelText: "Fecha de nacimiento",
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today, color: Colors.white),
                  onPressed: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (selectedDate != null) {
                      _dateController.text =
                          DateFormat('dd/MM/yyyy').format(selectedDate);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: AppColors.background,
                filled: true,
                labelText: "Contraseña",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: AppColors.background,
                filled: true,
                labelText: "Confirmar contraseña",
                labelStyle: TextStyle(color: Colors.white),
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
}
