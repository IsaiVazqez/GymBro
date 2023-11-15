import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/models/plan_model.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/core/api/gym_service.dart';
import 'package:gymbro/features/MyPlans/presentation/widgets/plans.dart';

class SubscribedPlansScreen extends StatefulWidget {
  @override
  _SubscribedPlansScreenState createState() => _SubscribedPlansScreenState();
}

class _SubscribedPlansScreenState extends State<SubscribedPlansScreen> {
  late Future<List<PlanElement>> futureSubscribedPlans;

  @override
  void initState() {
    super.initState();
    futureSubscribedPlans = GymService().fetchSubscribedPlans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Mis Planes Suscritos'),
      body: FutureBuilder<List<PlanElement>>(
        future: futureSubscribedPlans,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: snapshot.data!
                      .map((plan) => PlansCard(plan: plan))
                      .toList(),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'No estás suscrito a ningún plan.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
