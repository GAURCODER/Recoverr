import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/main/index_page.dart';
import 'package:lost_found/core/common/widgets/post_report_button.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';

class ReportMotivationPage extends StatelessWidget {
  final String motivationText1;
  final String motivationText2;
  final String imageUrl;

  const ReportMotivationPage({
    super.key,
    required this.motivationText1,
    required this.motivationText2,
    required this.imageUrl,
  });

  static MaterialPageRoute route(
      String motivationText1, String motivationText2, String imageUrl) {
    return MaterialPageRoute(
      builder: (context) => ReportMotivationPage(
        motivationText1: motivationText1,
        motivationText2: motivationText2,
        imageUrl: imageUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildHeading(
                motivationText1,
                color: AppPallete.blackColor,
                fontSize: 24,
              ),
            ],
          ),
          buildHeading(
            motivationText2,
            color: AppPallete.blackColor,
            fontSize: 15,
            bold: false,
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                height: 300,
                imageUrl,
                fit: BoxFit.contain,
                repeat: ImageRepeat.noRepeat,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PostReportButton(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  IndexPage.route(),
                  (route) => false,
                );
              },
              command: "Return to Home",
            ),
          ),
        ],
      ),
    );
  }
}
