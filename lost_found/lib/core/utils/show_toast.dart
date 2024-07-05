import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

void showToast({
  required String text,
  required context,
  IconData iconData = Icons.info,
  Color color = AppPallete.whiteColor,
  Color textColor = AppPallete.blackColor,
}) {
  try {
    DelightToastBar(
      autoDismiss: true,
      position: DelightSnackbarPosition.top,
      builder: (context) {
        return ToastCard(
          color: color,
          leading: Icon(
            iconData,
            size: 28,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: textColor,
            ),
          ),
        );
      },
    ).show(context);
  } catch (e) {
    throw Exception(e.toString());
  }
}
