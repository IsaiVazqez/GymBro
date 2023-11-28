// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/models/subcriptions_model.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/core/api/plans_service.dart';
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
            return const Center(
              child: Card(
                color: AppColors.darkGraySoft,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Necesitas iniciar sesión para tener planes suscritos.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
