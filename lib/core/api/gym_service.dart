import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gymbro/common/constants/api.dart';
import 'package:gymbro/common/models/gym_model.dart';
import 'package:gymbro/common/models/plan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GymService {
  final Dio _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<List<Gym>> fetchGyms() async {
    try {
      final response = await _dio.get('/branches');
      if (response.statusCode == 200) {
        final List<dynamic> gymsJson = response.data;
        return gymsJson.map((json) => Gym.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load gyms');
      }
    } catch (e) {
      print(e);
      throw Exception('Error fetching gyms');
    }
  }

  Future<Plan> fetchGymPlans(String gymUuid) async {
    try {
      final response = await _dio.get('/branches/$gymUuid/plans');
      if (response.statusCode == 200) {
        final Map<String, dynamic> planJson = response.data;
        return Plan.fromJson(planJson);
      } else {
        throw Exception('Failed to load plan');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw Exception('Error fetching plan');
    }
  }

  Future<void> subscribeToPlan(String planUuid) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final String url =
        'https://gymbro-services.onrender.com/api/subscriptions'; // Asegúrate de que esta URL sea correcta

    try {
      final response = await _dio.post(
        url,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
        data: jsonEncode({
          'plan': planUuid
        }), // Asegúrate de que el cuerpo de la solicitud esté bien formateado
      );

      if (response.statusCode == 201) {
        print('Subscribed to plan');
      } else {
        throw Exception('Failed to subscribe to plan');
      }
    } catch (e) {
      throw Exception('Error al suscribirse al plan: $e');
    }
  }

  Future<List<PlanElement>> fetchSubscribedPlans() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      final response = await _dio.get(
        'https://gymbro-services.onrender.com/api/plans',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        List<PlanElement> plans = [];
        for (var planJson in response.data) {
          plans.add(PlanElement.fromJson(planJson));
        }
        return plans;
      } else {
        throw Exception('Failed to load subscribed plans');
      }
    } catch (e) {
      throw Exception('Error fetching subscribed plans: $e');
    }
  }
}
