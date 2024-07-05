import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class PostReportButton extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double borderRadius;
  final double fontSize;
  final String command;

  const PostReportButton({
    super.key,
    required this.onTap,
    this.height = 50,
    this.borderRadius = 15,
    this.fontSize = 20,
    this.command = "Post",
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppPallete.deepPurple,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              command,
              style: TextStyle(
                fontSize: fontSize,
                color: AppPallete.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
