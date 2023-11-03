import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final SharedPreferences _prefs;

  UserService(this._prefs);

  Map<String, dynamic>? get user {
    final token = _prefs.getString('token');
    if (token != null) {
      try {
        return Jwt.parseJwt(token);
      } catch (e) {
        // Si el token no es válido o no se puede decodificar
        print('Error al decodificar el token: $e');
      }
    }
    return null;
  }
}
