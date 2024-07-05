import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class SwitchLogin extends StatelessWidget {
  final String text;
  final String direction;
  final VoidCallback onTap;
  const SwitchLogin({
    super.key,
    required this.text,
    required this.direction,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: AppPallete.greyShade600),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onTap,
          child: Text(
            direction,
            style: const TextStyle(
              color: AppPallete.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
