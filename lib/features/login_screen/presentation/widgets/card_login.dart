import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/constants/validators.dart';
import 'package:gymbro/common/widgets/bottom_navigation_bar/presentation/main_widget.dart';
import 'package:gymbro/features/home_screen/presentation/views/home_screen.dart';
import 'package:gymbro/features/login_screen/bloc/bloc/login_bloc.dart';
import 'package:gymbro/features/login_screen/presentation/views/register_screen.dart';
import 'package:gymbro/features/login_screen/presentation/widgets/text_field.dart';

class CardLogin extends StatelessWidget {
  const CardLogin({
    super.key,
    required this.size,
  });

  final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
          );
        } else if (state is LoginErrorState) {
          // Aquí es donde mostramos el SnackBar con el mensaje de error
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ShowFieldsState:
            return SingleChildScrollView(child: _LoginFields(size: size));
          default:
            return SingleChildScrollView(
                child:
                    _defaultView(size: size, state: state, context: context));
        }
      },
    );
  }

  Widget _defaultView(
      {required Size size,
      required LoginState state,
      required BuildContext context}) {
    return Container(
      height: size.height * 0.43,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            const Text(
              'Bienvenido a GymBro',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const Text(
              'Descubre la mejor forma de entrenar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkGraySoft,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    BlocProvider.of<LoginBloc>(context)
                        .add(ShowLoginFieldsEvent());
                  },
                  child: const Text('Inicia Sesión'),
                )),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500,
                      foregroundColor: Colors.black),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text('Registrate'),
                )),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Row(
              children: [
                Expanded(child: Divider(color: Colors.grey)),
                SizedBox(width: 10),
                Text(
                  '¿No tienes cuenta?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(child: Divider(color: Colors.grey)),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkGraySoft,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  child: const Text('Ingresa como invitado'),
                )),
            Expanded(
              child: state is ShowFieldsState
                  ? _LoginFields(size: size)
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginFields extends StatefulWidget {
  final Size size;
  const _LoginFields({required this.size});

  @override
  State<_LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<_LoginFields> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            children: [
              SizedBox(height: widget.size.height * 0.01),
              const Text('Ingresa tus credenciales',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: widget.size.height * 0.015),
              CustomTextField(
                controller: _emailController,
                labelText: "Correo electrónico",
                keyboardType: TextInputType.emailAddress,
                validator: Validators.validateEmail,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: _passwordController,
                labelText: "Contraseña",
                obscureText: true,
                validator: Validators.validatePassword,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(ShowDefaultViewEvent());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500,
                      foregroundColor: AppColors.background,
                    ),
                    child: const Text('Regresar'),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(fontSize: 15)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.darkGraySoft),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          context.read<LoginBloc>().add(
                                LoginSubmitted(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                      child: const Text('Ingresar')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
