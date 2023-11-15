import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/features/login_screen/presentation/views/login_screen.dart';
import 'package:gymbro/features/login_screen/presentation/widgets/text_field.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      final userData = Jwt.parseJwt(token);
      print("User Data: $userData");
      if (userData.containsKey('name')) {
        List<String> nameParts = userData['name'].split(' ');
        firstNameController.text = nameParts.first;
        lastNameController.text = nameParts.sublist(1).join(' ');
      }
      setState(() {});
    } else {
      print('No token found');
    }
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Eliminar el token
    // Navegar de vuelta a la pantalla de inicio de sesión
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Perfil'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildProfilePictureEditor(context),
              const SizedBox(height: 20),
              CustomTextField(
                controller: firstNameController,
                labelText: 'Primer Nombre',
                validator: (value) =>
                    value != null && value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: lastNameController,
                labelText: 'Apellidos',
                validator: (value) =>
                    value != null && value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: emailController,
                labelText: 'Correo',
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value != null && value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: birthDateController,
                labelText: 'Fecha de Nacimiento',
                hasDatePicker: true,
                validator: (value) =>
                    value != null && value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implementar la lógica de actualización
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.primary500, // foreground
                    ),
                    child: const Text('Actualizar'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _logout,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          Colors.red, // Color para el botón de cerrar sesión
                    ),
                    child: const Text('Cerrar Sesión'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePictureEditor(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
              'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'), // Cambia a la imagen que quieras mostrar
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: IconButton(
              icon: const Icon(Icons.edit, size: 20),
              onPressed: () {
                // Aquí puedes implementar la lógica para cambiar la foto de perfil
              },
            ),
          ),
        ),
      ],
    );
  }
}
