import 'package:flutter/material.dart';
import 'package:lost_found/features/main/views/report_user_flow.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.leadingIcon,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(leadingIcon),
        onPressed: () {
          Navigator.push(
            context,
            ReportUserFlow.route(),
          );
        },
      ),
      title: Text(
        title,
        textDirection: TextDirection.ltr,
        style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
