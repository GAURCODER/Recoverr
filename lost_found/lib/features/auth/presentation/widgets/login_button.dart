import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class LoginButton extends StatelessWidget {
  final String buttonCommand;
  final Function()? onTap;

  const LoginButton({
    super.key,
    required this.onTap,
    required this.buttonCommand,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: AppPallete.blackColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonCommand,
            style: const TextStyle(
              color: AppPallete.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
