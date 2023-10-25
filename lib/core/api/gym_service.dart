import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gymbro/common/constants/api.dart';
import 'package:gymbro/common/models/gym_model.dart';
import 'package:gymbro/common/models/plan_model.dart';

class GymService {
  final Dio _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<List<Gym>> fetchGyms() async {
    try {
      final response = await _dio.get('/gyms');
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
      final response = await _dio.get('/gyms/$gymUuid/plans');
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
}
