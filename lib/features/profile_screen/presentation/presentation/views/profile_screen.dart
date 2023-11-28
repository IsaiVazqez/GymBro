// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/models/user_mode.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/core/api/user_service.dart';
import 'package:gymbro/features/login_screen/presentation/views/login_screen.dart';
import 'package:gymbro/features/login_screen/presentation/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController phoneControler = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      final userProfile = await UserService().fetchUserProfile();
      firstNameController.text = userProfile.firstName!;
      lastNameController.text = userProfile.lastName!;
      emailController.text = userProfile.email!;
      phoneControler.text = userProfile.phone!;
      birthDateController.text = userProfile.birthdate!.toIso8601String();
      setState(() {});
    } catch (e) {
      // Manejar el error aquí
    }
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
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
              const SizedBox(height: 20),
              CustomTextField(
                controller: lastNameController,
                labelText: 'Apellidos',
                validator: (value) =>
                    value != null && value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: birthDateController,
                labelText: 'Fecha de Nacimiento',
                hasDatePicker: true,
                validator: (value) =>
                    value != null && value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: phoneControler,
                labelText: 'Teléfono',
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value != null && value.isEmpty ? 'Campo requerido' : null,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                enabled: false,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                labelText: 'Correo',
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value != null && value.isEmpty ? 'Campo requerido' : null,
                enabled: false,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        UserProfile updatedProfile = UserProfile(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          birthdate:
                              DateTime.tryParse(birthDateController.text),
                          phone: phoneControler.text,
                        );
                        bool success =
                            await UserService().updateProfile(updatedProfile);
                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Perfil actualizado con éxito'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Error al actualizar el perfil'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.primary500,
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
              'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: IconButton(
              icon: const Icon(Icons.edit, size: 20),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
