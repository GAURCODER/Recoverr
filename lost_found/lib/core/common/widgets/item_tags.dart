import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class ItemTags extends StatelessWidget {
  final String category;
  final double fontSize;
  const ItemTags({
    super.key,
    required this.category,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 2, 14, 2),
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.deepPurple),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        category,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: AppPallete.deepPurple,
        ),
      ),
    );
  }
}
