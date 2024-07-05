import 'package:flutter/material.dart';

class AppPallete {
  static const Color deepPurple = Color(0xff4f45bc);
  static const Color cyanBlue = Color(0xff71adee);
  static const Color lightPurple = Color(0xff837cff);
  static const Color lightGrey = Color(0xfff5f5f5);

  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static const Color errorColor = Colors.redAccent;
  static const Color transparentColor = Colors.transparent;

  static final greyShade200 = Colors.grey.shade200;
  static final greyShade300 = Colors.grey.shade300;
  static final greyShade400 = Colors.grey.shade400;
  static final greyShade500 = Colors.grey.shade500;
  static final greyShade600 = Colors.grey.shade500;
  static const gradient = LinearGradient(
    colors: [deepPurple, lightPurple, cyanBlue],
    stops: [0, 0.56, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const lostColor = Color.fromARGB(255, 191, 45, 45);
  static const foundColor = Color.fromARGB(231, 39, 118, 5);
  static const claimedColor = Color.fromARGB(255, 62, 67, 4);
}
