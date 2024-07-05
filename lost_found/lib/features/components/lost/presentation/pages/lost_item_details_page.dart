import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lost_found/core/common/widgets/chat_button.dart';
import 'package:lost_found/core/common/widgets/item_tags.dart';
import 'package:lost_found/core/common/widgets/text_description_widget.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/utils/show_toast.dart';
import 'package:lost_found/features/chats/presentation/rooms/user_interaction.dart';

class LostItemDetailsPage extends StatelessWidget {
  final String posterName;
  final String timeText;
  final String imageUrl;
  final String title;
  final String category;
  final String description;
  final String location;
  final String date;
  final String time;
  final String posterId;

  const LostItemDetailsPage({
    super.key,
    required this.posterName,
    required this.timeText,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.description,
    required this.location,
    required this.date,
    required this.time,
    required this.posterId,
  });

  static MaterialPageRoute route(
    String posterName,
    String timeText,
    String imageUrl,
    String title,
    String category,
    String description,
    String location,
    String date,
    String time,
    String posterId,
  ) {
    return MaterialPageRoute(
      builder: (context) => LostItemDetailsPage(
        posterName: posterName,
        timeText: timeText,
        imageUrl: imageUrl,
        title: title,
        category: category,
        description: description,
        location: location,
        date: date,
        time: time,
        posterId: posterId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final userId =
        (context.read<AppUserCubit>().state as AppUserLoggedIn).user.id;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 26.0,
                    ),
                  ),
                  const SizedBox(width: 10),
                  buildHeading(
                    "Lost Item",
                    color: AppPallete.blackColor,
                    fontSize: 20,
                    bold: false,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 1, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildHeading(
                      "Posted by $posterName",
                      fontSize: 14,
                      color: AppPallete.deepPurple,
                    ),
                    buildHeading(
                      timeText,
                      fontSize: 14,
                      color: AppPallete.deepPurple,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 250,
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppPallete.greyColor),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 55,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildHeading(
                      title,
                      color: AppPallete.blackColor,
                    ),
                    ItemTags(category: category),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.all(20),
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppPallete.deepPurple),
                        borderRadius: BorderRadius.circular(10),
                        color: AppPallete.lightGrey,
                      ),
                      child: AutoSizeText(
                        description,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppPallete.blackColor,
                        ),
                        minFontSize: 14,
                        maxLines: 4,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 55,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: Row(
                        children: [
                          buildHeading(
                            "Lost In",
                            color: AppPallete.blackColor,
                            fontSize: 15,
                            bold: false,
                          ),
                          const SizedBox(width: 12),
                          ItemTags(category: location),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.39,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildDescription(date),
                          buildDescription(time),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              ChatButton(
                onTap: () {
                  if (posterId != userId) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserInteraction(
                          userId: userId,
                          recieverId: posterId,
                          name: posterName,
                        ),
                      ),
                    );
                  } else {
                    showToast(text: "You posted it", context: context);
                  }
                },
                icon: const Icon(
                  CupertinoIcons.chat_bubble_fill,
                  color: AppPallete.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
