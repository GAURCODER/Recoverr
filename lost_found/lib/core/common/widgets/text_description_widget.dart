import 'package:flutter/material.dart';

Text buildDescription(String text,
    {double fontSize = 15.0, Color color = Colors.black}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
    ),
  );
}
