import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/features/login_screen/bloc/bloc/login_bloc.dart';
import 'package:gymbro/features/login_screen/presentation/widgets/card_login.dart';
import 'package:gymbro/features/login_screen/presentation/widgets/hexagons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                top: 0,
                bottom: size.height * 0.4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.darkGraySoft,
                    ),
                    child: CustomPaint(
                      painter: HexagonPainter(),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                child:
                    Image.asset('assets/logo.png', height: size.height * 0.27),
              ),
              Positioned(
                top: size.height * 0.40,
                left: 20,
                right: 20,
                child: CardLogin(size: size),
              ),
              Positioned(
                  top: size.height * 0.90,
                  left: 50,
                  child: const Text(
                    'Todos los derechos reservados UTM 2023',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
