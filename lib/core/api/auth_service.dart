import 'package:dio/dio.dart';
import 'package:gymbro/common/constants/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.post('/auth/customers', data: {
        'userName': email,
        'password': password,
      });

      if (response.statusCode == 201) {
        await _saveToken(response.data['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<bool> register({
    required String email,
    required String phone,
    required String birthdate,
    required String firstName,
    required String lastName,
    required String password,
    String? createdAt,
    String? updatedAt,
  }) async {
    try {
      final response = await _dio.post(
        '/customers/register',
        data: {
          "email": email,
          "phone": phone,
          "birthdate": birthdate,
          "password": password,
          "status": "string",
          "firstName": firstName,
          "lastName": lastName,
        },
      );

      if (response.statusCode == 201) {
        if (response.data['token'] != null) {
          await _saveToken(response.data['token']);
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {}
      return false;
    }
  }
}
