import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gymbro/common/constants/api.dart';
import 'package:gymbro/common/models/gym_model.dart';
import 'package:gymbro/common/models/images_model.dart';
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

  Future<List<Images>> fetchGymEquipment(String gymUuid) async {
    try {
      final response = await _dio.get('/branches/$gymUuid/equipment');
      if (response.statusCode == 200) {
        final List<dynamic> equipmentJson = response.data;
        return equipmentJson.map((json) => Images.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load equipment');
      }
    } catch (e) {
      throw Exception('Error fetching equipment');
    }
  }

  Future<void> subscribeToPlan(String planUuid) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      final response = await _dio.post(
        '$apiUrl/subscriptions',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
        data: jsonEncode({'plan': planUuid}),
      );

      if (response.statusCode == 400) {
        throw Exception('Ya estás suscrito a este plan');
      }
    } catch (e) {
      throw Exception('Ya estás suscrito a este plan');
    }
  }

  Future<List<PlanElement>> fetchSubscribedPlans() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      final response = await _dio.get(
        '$apiUrl/plans',
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
