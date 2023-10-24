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

  Future<List<Plan>> fetchGymPlans(String gymUuid) async {
    final String endpoint = '/gyms/$gymUuid/plans';
    try {
      print('Sending GET request to ${_dio.options.baseUrl}$endpoint');
      final response = await _dio.get(
        endpoint,
        options: Options(
          headers: {'uuid': gymUuid},
        ),
      );
      if (response.statusCode == 200) {
        final responseData = response.data;
        print(
            'Response data type: ${responseData.runtimeType}'); // Agregado para depuración

        if (responseData is String) {
          final data = json.decode(responseData);
          if (data is Map<String, dynamic>) {
            final List<dynamic> plansJson = data['plans'];
            if (plansJson != null) {
              return plansJson.map((json) => Plan.fromJson(json)).toList();
            } else {
              throw Exception('Plans data is not a list');
            }
          } else {
            throw Exception('Response data is not a map');
          }
        } else {
          throw Exception('Response data is not a string');
        }
      } else {
        throw Exception('Failed to load gym plans');
      }
    } catch (e) {
      print('Error fetching gym plans: $e');
      throw Exception('Error fetching gym plans');
    }
  }
}
