import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class FormDataFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const FormDataFields({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppPallete.greyShade600),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppPallete.deepPurple),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppPallete.deepPurple),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppPallete.deepPurple),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: AppPallete.greyShade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: AppPallete.greyShade500),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "$hintText is missing!";
          }
          return null;
        },
      ),
    );
  }
}
