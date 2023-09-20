import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/features/login_screen/bloc/bloc/login_bloc.dart';

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
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: size.height * 0.43,
          decoration: BoxDecoration(
            color: Colors.white,
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
                              Colors.blue, // Color de fondo del botón
                          foregroundColor: Colors
                              .white // Color del texto y del icono (si lo tienes)
                          ),
                      onPressed: () {
                        context.read<LoginBloc>().add(ShowLoginFieldsEvent());
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
                          backgroundColor:
                              Colors.white, // Color de fondo del botón
                          foregroundColor: Colors
                              .black // Color del texto y del icono (si lo tienes)

                          ),
                      onPressed: () {},
                      child: const Text('Register'),
                    )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    SizedBox(width: 10), // Espacio entre la línea y el texto
                    Text('Utiliza redes sociales'),
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
                      width:
                          size.width * 0.15, // Establece la anchura que deseas
                      height:
                          size.height * 0.06, // Establece la altura que deseas
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets
                              .zero, // Poner a cero para usar el tamaño del Container
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
                      width:
                          size.width * 0.15, // Establece la anchura que deseas
                      height:
                          size.height * 0.06, // Establece la altura que deseas
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
                      ? _LoginFields() // Aquí se mostrarán tus TextFields y botón
                      : Container(), // Un contenedor vacío cuando no estás mostrando los campos
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LoginFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Correo electrónico',
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16.0),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(onPressed: () {}, child: Text('Ingresar')),
      ],
    );
  }
}
