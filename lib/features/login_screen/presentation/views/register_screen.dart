import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/constants/validators.dart';
import 'package:gymbro/features/login_screen/bloc/bloc/login_bloc.dart';
import 'package:gymbro/features/login_screen/presentation/widgets/text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          _showRegistrationDialog(
                  context: context,
                  title: 'Registro Completado',
                  message: state.registrationMessage)
              .then((_) {});
        } else if (state is RegisterErrorState) {
          _showRegistrationDialog(
              context: context,
              title: 'Error de Registro',
              message: state.errorMessage);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          title: const Text(
            'Crea tu cuenta',
            style: TextStyle(
              color: AppColors.primary500,
              fontWeight: FontWeight.bold,
            ),
          ),
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
              child: _RegisterCard(
                size: size,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showRegistrationDialog(
      {required BuildContext context,
      required String title,
      required String message}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // El usuario necesita presionar el botón para cerrar el diálogo
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.pop(
                    dialogContext); // Asegúrate de usar dialogContext aquí
              },
            ),
          ],
        );
      },
    );
  }
}

class _RegisterCard extends StatefulWidget {
  final Size size;

  const _RegisterCard({required this.size});

  @override
  State<_RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<_RegisterCard> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isFormValid = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        color: AppColors.background,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.primary500, width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 20),
              CustomTextField(
                controller: _nameController,
                labelText: "Primer nombre",
                validator: Validators.validateName,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _secondNameController,
                labelText: "Segundo nombre",
                validator: Validators.validateName,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _phoneController,
                labelText: "Número telefónico",
                keyboardType: TextInputType.phone,
                validator: Validators.validatePhoneNumber,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _emailController,
                labelText: "Correo electrónico",
                keyboardType: TextInputType.emailAddress,
                validator: Validators.validateEmail,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _passwordController,
                labelText: "Contraseña",
                obscureText: true,
                validator: Validators.validatePassword,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                validator: (value) => Validators.validateConfirmPassword(
                    value!, _passwordController.text),
                controller: _passwordConfirmController,
                labelText: "Confirmar contraseña",
                obscureText: true,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _dateController,
                labelText: "Fecha de nacimiento",
                hasDatePicker: true,
                validator: Validators.validateBirthDate,
              ),
              const SizedBox(height: 30),
              confirmRegistration(),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton confirmRegistration() {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor:
            MaterialStateColor.resolveWith((states) => Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 15),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.background),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
              color:
                  _isFormValid ? AppColors.primary500 : AppColors.darkGraySoft,
              width: 1.0),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: () {
        {
          if (_formKey.currentState!.validate()) {
            context.read<LoginBloc>().add(
                  RegisterSubmitted(
                    email: _emailController.text,
                    phone: _phoneController.text,
                    birthdate: _dateController.text,
                    firstName: _nameController.text,
                    lastName: _secondNameController.text,
                    password: _passwordController.text,
                  ),
                );

            // Escuchar cambios de estado del LoginBloc

            setState(() {
              _isFormValid = true;
            });
          } else {
            setState(() {
              _isFormValid = false;
            });
          }
        }
      },
      child: const Text("Registrarse"),
    );
  }
}
