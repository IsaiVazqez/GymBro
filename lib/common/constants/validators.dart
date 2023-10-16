import 'package:intl/intl.dart';

class Validators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'El nombre no puede estar vacío.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'El correo electrónico no puede estar vacío.';
    }
    if (!value.contains('@')) {
      return 'Ingrese un correo electrónico válido.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña no puede estar vacía.';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres.';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String value, String passwordToCompare) {
    if (value != passwordToCompare) {
      return 'Las contraseñas no coinciden.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'El número telefónico no puede estar vacío.';
    }
    if (value.length < 10) {
      return 'El número telefónico debe tener al menos 10 caracteres.';
    }
    return null;
  }

  static String? validateBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'La fecha de nacimiento no puede estar vacía.';
    }

    DateTime? birthDate;
    try {
      birthDate = DateFormat('dd/MM/yyyy').parse(value);
    } catch (e) {
      return 'Formato de fecha no válido. Usa el formato dd/MM/yyyy.';
    }

    final currentDate = DateTime.now();
    final age = currentDate.year -
        birthDate.year -
        ((currentDate.month < birthDate.month ||
                (currentDate.month == birthDate.month &&
                    currentDate.day < birthDate.day))
            ? 1
            : 0);

    if (age < 15) {
      return 'Debes tener al menos 15 años.';
    }

    return null;
  }
}
