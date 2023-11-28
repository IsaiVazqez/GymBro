import 'package:dio/dio.dart';
import 'package:gymbro/common/models/subcriptions_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Subcriptions>> fetchSubscribedPlans() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final dio = Dio();

  try {
    final response = await dio.get(
      'https://gymbro-services.onrender.com/api/customers/subscriptions',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (response.statusCode == 200) {
      final data = List<Map<String, dynamic>>.from(response.data);
      return data.map((json) => Subcriptions.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load subscribed plans');
    }
  } catch (e) {
    throw Exception('Error fetching subscribed plans: $e');
  }
}
