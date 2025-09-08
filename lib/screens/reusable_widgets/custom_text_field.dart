import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.controller,
  });

   @override
    Widget build(BuildContext context) {
      return TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
           ),
           contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
         ),
      );
    }


}