import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class Tag extends StatelessWidget {
  final String status;
  final Color color;
  final double topMargin;
  final Color textColor;
  final double fontSize;

  const Tag({
    super.key,
    required this.status,
    required this.color,
    this.topMargin = 8.0,
    this.textColor = AppPallete.whiteColor,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(top: topMargin),
          height: 30,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                status,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
