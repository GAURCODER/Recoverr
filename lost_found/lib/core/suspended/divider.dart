import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class LoginOptionDivider extends StatelessWidget {
  const LoginOptionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: AppPallete.greyShade400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Or continue with',
              style: TextStyle(color: AppPallete.greyShade600),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: AppPallete.greyShade400,
            ),
          ),
        ],
      ),
    );
  }
}
