import 'dart:io';
import 'package:flutter/material.dart';

class SelectedImage extends StatelessWidget {
  final File? image;
  final Function onTap;
  const SelectedImage({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 250.0,
          width: double.infinity,
          child: Image.file(
            image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
