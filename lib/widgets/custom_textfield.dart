import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_35/colors/color_palette.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final String labelText;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hint,
    this.obscure = false, 
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hint,
        filled: true,
        fillColor: ColorPalette.primaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}