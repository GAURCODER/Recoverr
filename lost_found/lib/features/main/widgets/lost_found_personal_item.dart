import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:lost_found/core/common/widgets/item_tags.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/main/widgets/tag.dart';

class LostFoundPersonalItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String category;
  final String status;
  const LostFoundPersonalItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 180,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 140,
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              border: Border.all(color: AppPallete.transparentColor),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    height: 150,
                    width: 140,
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Tag(
                  status: status,
                  color: (status == "Lost")
                      ? AppPallete.lostColor
                      : AppPallete.foundColor,
                  fontSize: 14,
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          // ignore: sized_box_for_whitespace
          Container(
            height: 150,
            width: 220,
            // decoration: BoxDecoration(
            //   border: Border.all(color: AppPallete.greyColor),
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeading(
                  title,
                  color: AppPallete.blackColor,
                  fontSize: 14,
                ),
                AutoSizeText(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  minFontSize: 8,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                ItemTags(category: category),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
