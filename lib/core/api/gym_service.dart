import 'package:dio/dio.dart';
import 'package:gymbro/common/models/gym_model.dart';

Future<List<Gym>> fetchGyms() async {
  final response =
      await Dio().get('https://gymbro-services.onrender.com/api/gyms');
  if (response.statusCode == 200) {
    final List<dynamic> gymsJson = response.data;
    return gymsJson.map((json) => Gym.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load gyms');
  }
}
