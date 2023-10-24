import 'package:dio/dio.dart';
import 'package:gymbro/common/constants/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'username': email,
        'password': password,
      });

      if (response.statusCode == 201) {
        await _saveToken(response.data['token']);
        print('Login exitoso');
        return true;
      } else {
        // Error durante el login
        print('Error during login: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
