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
          print('Registro exitoso y token guardado');
          return true;
        } else {
          print('Registro exitoso pero sin token');
          return false;
        }
      } else {
        print('Error during registration: ${response.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      print('Error during registration: $e');
      if (e.response != null) {
        print('Error sending request!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      }
      return false;
    }
  }
}
