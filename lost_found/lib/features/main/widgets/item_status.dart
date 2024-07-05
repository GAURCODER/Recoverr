import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class ItemStatus extends StatelessWidget {
  final IconData iconData;
  final String status;
  const ItemStatus({
    super.key,
    required this.iconData,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: AppPallete.greyColor,
        ),
        color: AppPallete.lightGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: 70.0,
            color: AppPallete.deepPurple,
          ),
          Text(
            status,
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              fontSize: 18.0,
              color: AppPallete.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
