import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputType? inputType;
  final FormFieldValidator<String>? validator; // Alteração aqui

  const CustomInput({
    Key? key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.inputType, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType ?? keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        // floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
      
      validator: validator, // Alteração aqui
    );
  }
}
