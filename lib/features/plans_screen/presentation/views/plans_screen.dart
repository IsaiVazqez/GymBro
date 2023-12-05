// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/models/subcriptions_model.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/core/api/plans_service.dart';
import 'package:gymbro/features/login_screen/presentation/views/login_screen.dart';
import 'package:gymbro/features/plans_screen/presentation/widgets/plans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscribedPlansScreen extends StatefulWidget {
  const SubscribedPlansScreen({super.key});

  @override
  _SubscribedPlansScreenState createState() => _SubscribedPlansScreenState();
}

class _SubscribedPlansScreenState extends State<SubscribedPlansScreen> {
  late Future<bool> _isTokenAvailable;
  late Future<List<Subcriptions>> futureSubscriptions;

  @override
  void initState() {
    super.initState();
    _isTokenAvailable = _checkToken();
  }

  Future<bool> _checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      futureSubscriptions = fetchSubscribedPlans();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Mis Planes Suscritos'),
      body: FutureBuilder<bool>(
        future: _isTokenAvailable,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == true) {
            return FutureBuilder<List<Subcriptions>>(
              future: futureSubscriptions,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay planes suscritos'));
                }

                final plans = snapshot.data!;
                return ListView.builder(
                  itemCount: plans.length,
                  itemBuilder: (context, index) {
                    final subscription = plans[index];
                    return PlanCard(subscription: subscription);
                  },
                );
              },
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.error_outline,
                    size: 60,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Necesitas iniciar sesión',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Por favor, inicia sesión para tener una lista de tus planes suscritos.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.primary500,
                    ),
                    child: const Text('Inicio de Sesión'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
