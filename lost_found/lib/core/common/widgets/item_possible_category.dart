import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class ItemPossibleCategory extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final bool isSelected;
  final Function onTap;

  const ItemPossibleCategory(
      {super.key,
      required this.text,
      required this.controller,
      required this.isSelected,
      required this.onTap});

  @override
  State<ItemPossibleCategory> createState() => _ItemPossibleCategoryState();
}

class _ItemPossibleCategoryState extends State<ItemPossibleCategory> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = widget.isSelected
        ? AppPallete.lightPurple
        : AppPallete.transparentColor;
    Color textColor =
        widget.isSelected ? AppPallete.whiteColor : AppPallete.blackColor;

    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 2, 6, 7),
        child: Container(
          height: 42.0,
          width: 100.0,
          decoration: BoxDecoration(
            border: Border.all(color: AppPallete.greyColor),
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor,
          ),
          child: Center(
            child: Text(
              widget.text,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 14.0,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
