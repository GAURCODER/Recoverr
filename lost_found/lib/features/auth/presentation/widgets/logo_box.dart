import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class LogoWidget extends StatelessWidget {
  final String imagePath;
  const LogoWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.greyShade200),
        borderRadius: BorderRadius.circular(16),
        color: AppPallete.whiteColor,
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
