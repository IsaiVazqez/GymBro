import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/models/images_model.dart';
import 'package:gymbro/common/models/plan_model.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/core/api/gym_service.dart';
import 'package:gymbro/features/gym_screen/presentation/widgets/plan_card.dart';

class GymScreen extends StatefulWidget {
  final String gymUuid;

  const GymScreen({Key? key, required this.gymUuid}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GymScreenState createState() => _GymScreenState();
}

class _GymScreenState extends State<GymScreen> {
  Plan? plan;
  List<Images>? equipment;
  String? error;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadGymData();
  }

  Future<void> loadGymData() async {
    try {
      final GymService gymService = GymService();
      plan = await gymService.fetchGymPlans(widget.gymUuid);
      equipment = await gymService.fetchGymEquipment(widget.gymUuid);
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(title: ''),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (error != null) {
      return Center(child: Text(error!));
    }

    final plans = plan?.plans ?? [];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (equipment != null && equipment!.isNotEmpty)
                if (plan != null) const SizedBox(height: 8),
              Card(
                color: AppColors.darkGraySoft,
                margin: const EdgeInsets.symmetric(vertical: 10),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: AppColors.lightGreen, width: 1),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan!.name ?? 'Nombre del Gimnasio',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightGreen,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Dirección: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.lightGreen,
                              ),
                            ),
                            TextSpan(
                              text: plan!.address != null
                                  ? ' Calle ${plan!.address!.street}, Número ${plan!.address!.building}, C.P ${plan!.address!.zip}, ${plan!.address!.neighborhood}, ${plan!.address!.city}, ${plan!.address!.state}, ${plan!.address!.country}'
                                  : ' No Disponible',
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Número: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.lightGreen,
                              ),
                            ),
                            TextSpan(
                              text: plan!.phone ?? ' No Disponible',
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              (equipment == null || equipment!.isEmpty)
                  ? SizedBox.shrink() // No muestra nada si no hay imágenes
                  : CarouselSlider(
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                      ),
                      items: equipment!.map((imageItem) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(0.0, 2.0),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  'https://gymbro-images.s3.us-east-2.amazonaws.com/${imageItem.image}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
              const SizedBox(height: 16),
              const Text(
                'Planes Disponibles',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColors.lightGreen, // Color específico para "Número"
                ),
              ),
              const SizedBox(height: 8),
              if (plans.isEmpty)
                const Text(
                  'Este gimnasio no tiene planes disponibles.',
                  style: TextStyle(color: Colors.white),
                )
              else
                for (final planItem in plans) PlanCard(plan: planItem),
            ],
          ),
        ),
      ),
    );
  }
}
