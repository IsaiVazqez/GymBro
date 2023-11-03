import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:gymbro/common/widgets/app_bar/presentation/custom_appbar.dart';
import 'package:gymbro/features/gym_screen/presentation/widgets/plan_card.dart';
import 'package:gymbro/features/home_screen/bloc/gym_bloc.dart';

class GymScreen extends StatelessWidget {
  final String gymUuid;

  const GymScreen({Key? key, required this.gymUuid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GymBloc>().add(LoadGymPlansEvent(gymUuid));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
        title: '',
      ),
      body: BlocBuilder<GymBloc, GymState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case GymPlansLoading:
              return const Center(child: CircularProgressIndicator());
            case GymPlansLoaded:
              final plan = (state as GymPlansLoaded).plan;
              final plans = state.plan.plans;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan.name ?? 'Nombre del Gimnasio',
                        style: AppTextStyles.title,
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Dirección: ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                              // Aquí construyes la cadena de texto que representa la dirección completa.
                              text: plan.address != null
                                  ? ' Calle ${plan.address!.street}, Número ${plan.address!.building}, C.P ${plan.address!.zip}, ${plan.address!.neighborhood}, ${plan.address!.city}, ${plan.address!.state}, ${plan.address!.country}'
                                  : 'No Disponible',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Número: ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                              text: plan.phone ?? 'No Disponible',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Planes Disponibles',
                        style: AppTextStyles.title,
                      ),
                      const SizedBox(height: 8),
                      if (plans!.isEmpty)
                        const Text(
                          'Este gimnasio no tiene planes disponibles.',
                          style: TextStyle(color: Colors.white),
                        )
                      else
                        for (final plan in plans) PlanCard(plan: plan),
                    ],
                  ),
                ),
              );
            // Manejo de otros estados...
            case GymPlansError:
              return Center(child: Text((state as GymPlansError).message));
            default:
              return const Center(
                  child: Text(
                'Algo salió mal',
                style: TextStyle(color: Colors.white),
              ));
          }
        },
      ),
    );
  }
}
