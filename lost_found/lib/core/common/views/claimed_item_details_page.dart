import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lost_found/core/common/widgets/chat_button.dart';
import 'package:lost_found/core/common/widgets/item_tags.dart';
import 'package:lost_found/core/common/widgets/text_description_widget.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class ClaimedItemDetailsPage extends StatefulWidget {
  final String posterName;
  final String claimedTimeText;
  final String imageUrl;
  final String title;
  final String category;
  final String description;
  final String location;
  final DateTime claimedTime;
  final String collectionCenter;
  final String posterId;
  final String id;

  const ClaimedItemDetailsPage({
    super.key,
    required this.posterName,
    required this.claimedTimeText,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.description,
    required this.location,
    required this.claimedTime,
    required this.collectionCenter,
    required this.posterId,
    required this.id,
  });

  static MaterialPageRoute route(
    String posterName,
    String claimedTimeText,
    String imageUrl,
    String title,
    String category,
    String description,
    String location,
    DateTime claimedTime,
    String collectionCenter,
    String posterId,
    String id,
  ) {
    return MaterialPageRoute(
      builder: (context) => ClaimedItemDetailsPage(
        posterName: posterName,
        claimedTimeText: claimedTimeText,
        imageUrl: imageUrl,
        title: title,
        category: category,
        description: description,
        location: location,
        claimedTime: claimedTime,
        collectionCenter: collectionCenter,
        posterId: posterId,
        id: id,
      ),
    );
  }

  @override
  State<ClaimedItemDetailsPage> createState() => _ClaimedItemDetailsPageState();
}

class _ClaimedItemDetailsPageState extends State<ClaimedItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                    "Claimed Item",
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
                      "Posted by ${widget.posterName}",
                      fontSize: 14,
                      color: AppPallete.deepPurple,
                    ),
                    buildHeading(
                      widget.claimedTimeText,
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
                    widget.imageUrl,
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
                      widget.title,
                      color: AppPallete.blackColor,
                    ),
                    ItemTags(category: widget.category),
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
                        widget.description,
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
                margin: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: Row(
                        children: [
                          buildHeading(
                            "Found In",
                            color: AppPallete.blackColor,
                            fontSize: 15,
                            bold: false,
                          ),
                          const SizedBox(width: 12),
                          ItemTags(
                            category: widget.location,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.39,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildDescription(DateFormat('dd/MM/yyyy')
                              .format(widget.claimedTime)),
                          buildDescription(
                              DateFormat('h:mm a').format(widget.claimedTime)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 55,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    buildHeading(
                      "To be collected from",
                      color: AppPallete.blackColor,
                      fontSize: 15,
                      bold: false,
                    ),
                    const SizedBox(width: 12),
                    ItemTags(
                      category: widget.collectionCenter,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              const SizedBox(height: 10),

              // Chat with finder
              ChatButton(
                onTap: () {},
                icon: const Icon(
                  CupertinoIcons.shield_fill,
                  color: AppPallete.deepPurple,
                ),
                command: "Item claimed",
                color: AppPallete.transparentColor,
                textColor: AppPallete.deepPurple,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
