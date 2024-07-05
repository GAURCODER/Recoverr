import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

Text buildHeading(String text,
    {double fontSize = 17.0,
    Color color = AppPallete.deepPurple,
    bool bold = true}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: bold ? FontWeight.w600 : FontWeight.w500,
      color: color,
    ),
  );
}
