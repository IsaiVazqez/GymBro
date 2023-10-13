import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/features/home_screen/presentation/views/home_screen.dart';
import 'package:gymbro/features/login_screen/bloc/bloc/login_bloc.dart';
import 'package:gymbro/features/login_screen/presentation/views/register_screen.dart';

class CardLogin extends StatelessWidget {
  const CardLogin({
    super.key,
    required this.size,
  });

  final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {},
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
                      backgroundColor:
                          AppColors.darkGraySoft, // Color de fondo del botón
                      foregroundColor: Colors
                          .white // Color del texto y del icono (si lo tienes)
                      ),
                  onPressed: () {
                    BlocProvider.of<LoginBloc>(context)
                        .add(ShowLoginFieldsEvent());
                  },
                  child: const Text('Login'),
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
                  child: const Text('Register'),
                )),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Row(
              children: [
                Expanded(child: Divider(color: Colors.grey)),
                SizedBox(width: 10), // Espacio entre la línea y el texto
                Text(
                  'Utiliza redes sociales',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10), // Espacio entre el texto y la línea
                Expanded(child: Divider(color: Colors.grey)),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.15,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.facebook,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(width: size.width * .1), // Espacio entre botones
                SizedBox(
                  width: size.width * 0.15, // Establece la anchura que deseas
                  height: size.height * 0.06, // Establece la altura que deseas
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets
                          .zero, // Poner a cero para usar el tamaño del Container
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.red,
                    ),
                    child: const Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: state is ShowFieldsState
                  ? _LoginFields(size: size)
                  : Container(), // Un contenedor vacío cuando no estás mostrando los campos
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginFields extends StatelessWidget {
  final Size size;

  const _LoginFields({required this.size});

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                labelText: 'Correo electrónico',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                labelText: 'Contraseña',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder(),
              ),
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
                    foregroundColor: AppColors.background, // foreground
                  ),
                  child: const Text('Regresar'),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(fontSize: 15),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.darkGraySoft)),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    child: const Text('Ingresar')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
