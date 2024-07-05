import 'package:flutter/material.dart';
import 'package:lost_found/features/main/widgets/item_status.dart';

class ReportItem extends StatelessWidget {
  final String status;
  final IconData iconData;
  final VoidCallback onTap;

  const ReportItem({
    super.key,
    required this.status,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ItemStatus(
        iconData: iconData,
        status: status,
      ),
    );
  }
}
