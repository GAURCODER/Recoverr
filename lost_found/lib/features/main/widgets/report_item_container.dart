import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/main/views/report_user_flow.dart';
import 'package:lost_found/core/common/widgets/post_report_button.dart';
import 'package:lost_found/core/common/widgets/text_description_widget.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';

class ReportItemContainer extends StatelessWidget {
  const ReportItemContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          border: Border.all(color: AppPallete.greyColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(35, 20, 35, 0),
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeading(
                      "Lost an item?",
                      fontSize: 20.0,
                      bold: true,
                      color: AppPallete.blackColor,
                    ),
                    buildHeading(
                      "Or found a lost item?",
                      fontSize: 18.0,
                      bold: true,
                      color: AppPallete.blackColor,
                    ),
                    const SizedBox(height: 15),
                    buildDescription(
                      "You can report it here to find",
                      fontSize: 16.0,
                    ),
                    buildDescription(
                      "it or help someone",
                      fontSize: 16.0,
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                const Icon(
                  Icons.waving_hand_outlined,
                  size: 40.0,
                )
              ],
            ),
            const SizedBox(height: 20),
            PostReportButton(
              height: 40,
              borderRadius: 10,
              fontSize: 17,
              command: "Report an item",
              onTap: () {
                Navigator.push(context, ReportUserFlow.route());
              },
            )
          ],
        ),
      ),
    );
  }
}
