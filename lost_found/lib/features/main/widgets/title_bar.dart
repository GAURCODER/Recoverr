import 'package:flutter/cupertino.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleBar({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPallete.lightGrey,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onTap,
              child: const Icon(
                CupertinoIcons.back,
                size: 35,
              ),
            ),
            const SizedBox(width: 20),
            buildHeading(
              title,
              color: AppPallete.blackColor,
              fontSize: 20,
              bold: false,
            ),
          ],
        ),
      ),
    );
  }
}
