import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class ItemSuggestedLocationLists extends StatefulWidget {
  final IconData iconData;
  final String text;
  final TextEditingController controller;
  final bool isSelected;
  final Function onTap;

  const ItemSuggestedLocationLists({
    super.key,
    required this.iconData,
    required this.text,
    required this.controller,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<ItemSuggestedLocationLists> createState() =>
      _ItemSuggestedLocationListsState();
}

class _ItemSuggestedLocationListsState
    extends State<ItemSuggestedLocationLists> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = widget.isSelected
        ? AppPallete.lightPurple
        : AppPallete.transparentColor;
    Color textColor =
        widget.isSelected ? AppPallete.whiteColor : AppPallete.blackColor;
    Color iconColor =
        widget.isSelected ? AppPallete.whiteColor : AppPallete.greyColor;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 0.0),
      child: GestureDetector(
        onTap: () {
          // Call the onTap callback when tapped
          widget.onTap();
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(color: AppPallete.greyColor),
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  widget.iconData,
                  size: 40.0,
                  color: iconColor,
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
