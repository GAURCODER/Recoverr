import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/main/widgets/tag.dart';

class SmallCard extends StatelessWidget {
  final String imageUrl;
  final String status;
  final String title;
  final String location;
  final String postedBy;
  final String time;
  final Color color;

  const SmallCard({
    super.key,
    required this.imageUrl,
    required this.status,
    required this.title,
    required this.location,
    required this.postedBy,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 200,
      width: screenWidth * 0.46,
      margin: const EdgeInsets.fromLTRB(5, 15, 10, 15),
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.greyColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              width: double.infinity,
              height: double.infinity,
              imageUrl,
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
            ),
          ),
          Tag(
            status: status,
            color: color,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 90,
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppPallete.greyShade200,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppPallete.blackColor,
                      ),
                      minFontSize: 8,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AutoSizeText(
                      "Lost in $location",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppPallete.blackColor,
                      ),
                      minFontSize: 8,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          "Posted by $postedBy",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppPallete.deepPurple,
                          ),
                          minFontSize: 8,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Flexible(
                          child: AutoSizeText(
                            time,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppPallete.deepPurple,
                            ),
                            minFontSize: 8,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
