import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/main/widgets/tag.dart';

class Cards extends StatelessWidget {
  final String title;
  final String description;
  final String user;
  final String time;
  final String imageUrl;
  final String status;
  final Color color;
  final Color textColor;
  final double fontSize;
  final bool claimedItem;
  final String claimedText;

  const Cards({
    super.key,
    required this.title,
    required this.description,
    required this.user,
    required this.time,
    required this.imageUrl,
    required this.status,
    required this.color,
    this.textColor = AppPallete.whiteColor,
    this.fontSize = 16,
    this.claimedItem = false,
    this.claimedText = "",
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.93,
                padding: const EdgeInsets.fromLTRB(0, 5, 2, 1),
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: AppPallete.deepPurple),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Wrap(
                  children: [
                    Container(
                      width: screenWidth * 0.58,
                      height: 190,
                      padding: const EdgeInsets.fromLTRB(20, 5, 30, 0),
                      decoration: BoxDecoration(
                        // border: Border.all(color: AppPallete.greyColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 20,
                            width: double.infinity,
                            child: AutoSizeText(
                              title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              minFontSize: 8,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 110,
                            width: double.infinity,
                            child: AutoSizeText(
                              description,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              minFontSize: 8,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                claimedItem == false
                                    ? "Posted by $user"
                                    : claimedText,
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppPallete.deepPurple),
                                minFontSize: 8,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              AutoSizeText(
                                time,
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppPallete.deepPurple),
                                minFontSize: 8,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.34,
                      height: 190,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          repeat: ImageRepeat.noRepeat,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Tag(
            status: status,
            color: color,
            topMargin: 25.0,
            textColor: textColor,
            fontSize: fontSize,
          ),
        ],
      ),
    );
  }
}
