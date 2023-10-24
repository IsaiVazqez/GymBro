import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/features/login_screen/presentation/widgets/text_field.dart';

class ProfileScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  ProfileScreen({Key? key}) : super(key: key);

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
                controller: passwordController,
                labelText: 'Contraseña',
                obscureText: true,
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
        CircleAvatar(
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
