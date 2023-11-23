import 'package:dio/dio.dart';
import 'package:gymbro/common/constants/api.dart';
import 'package:gymbro/common/models/user_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final Dio _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<UserProfile> fetchUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      final response = await _dio.get(
        '$apiUrl/customers/profile',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        return UserProfile.fromJson(response.data);
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      throw Exception('Error fetching user profile: $e');
    }
  }

  Future<bool> updateProfile(UserProfile userProfile) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final data = {
      "phone": userProfile.phone,
      "birthdate": userProfile.birthdate?.toIso8601String(),
      "firstName": userProfile.firstName,
      "lastName": userProfile.lastName,
    };

    print(
        'Datos enviados para actualización: $data'); // Imprimir los datos enviados

    try {
      final response = await _dio.patch(
        '$apiUrl/customers/profile',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: data,
      );

      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Error updating user profile: $e');
    }
  }
}
