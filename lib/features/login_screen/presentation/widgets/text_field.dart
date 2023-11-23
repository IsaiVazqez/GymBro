// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gymbro/common/constants/colors.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool hasDatePicker;
  final String? Function(String?)? validator;
  final bool enabled; // Nuevo parámetro

  const CustomTextField({
    Key? key,
    required this.validator,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.hasDatePicker = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Color _borderColor = AppColors.darkGraySoft;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if (widget.controller.text.isNotEmpty) {
        setState(() {
          _borderColor = AppColors.primary500;
        });
      } else {
        setState(() {
          _borderColor = AppColors.darkGraySoft;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        fillColor: AppColors.background,
        filled: true,
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _borderColor, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary500, width: 1.0),
        ),
        suffixIcon: widget.hasDatePicker
            ? IconButton(
                icon: const Icon(Icons.calendar_today, color: Colors.white),
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (selectedDate != null) {
                    widget.controller.text =
                        DateFormat('dd/MM/yyyy').format(selectedDate);
                  }
                },
              )
            : null,
      ),
    );
  }
}
