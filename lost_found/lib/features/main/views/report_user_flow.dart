import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/components/found/presentation/pages/report_found_item.dart';
import 'package:lost_found/features/components/lost/presentation/pages/report_lost_item.dart';
import 'package:lost_found/features/main/index_page.dart';
import 'package:lost_found/features/main/widgets/report_item.dart';

class ReportUserFlow extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ReportUserFlow());
  const ReportUserFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              IndexPage.route(),
              (route) => false,
            );
          },
        ),
        backgroundColor: AppPallete.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'What do you want to report?',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppPallete.blackColor,
              ),
            ),
            const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReportItem(
                  iconData: Icons.sentiment_dissatisfied_rounded,
                  status: "Item you lost",
                  onTap: () {
                    Navigator.push(
                      context,
                      ReportLostItem.route(),
                    );
                  },
                ),
                ReportItem(
                  iconData: Icons.sentiment_satisfied_alt_rounded,
                  status: "Item you found",
                  onTap: () {
                    Navigator.push(
                      context,
                      ReportFoundItem.route(),
                    );
                  },
                ),
              ],
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ), // To take up remaining space
          ],
        ),
      ),
    );
  }
}
