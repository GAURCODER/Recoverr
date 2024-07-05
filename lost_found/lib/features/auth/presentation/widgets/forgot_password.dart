import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Forgot Password?',
            style: TextStyle(color: AppPallete.greyShade600),
          ),
        ],
      ),
    );
  }
}
