import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class ChatButton extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double borderRadius;
  final double fontSize;
  final String command;
  final Icon icon;
  final Color color;
  final Color textColor;
  final FontWeight fontWeight;

  const ChatButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.height = 50,
    this.borderRadius = 15,
    this.fontSize = 18,
    this.command = "Leave a message to owner",
    this.color = AppPallete.deepPurple,
    this.textColor = AppPallete.whiteColor,
    this.fontWeight = FontWeight.w400,
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
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              command,
              style: TextStyle(
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
