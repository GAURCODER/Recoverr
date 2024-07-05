import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/views/claimed_item_details_page.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/utils/show_snackbar.dart';
import 'package:lost_found/features/components/backend/presentation/bloc/backend_information_bloc.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/entities/combined_lost_found.dart';
import 'package:lost_found/features/components/found/presentation/pages/found_item_details_page.dart';
import 'package:lost_found/features/components/lost/presentation/pages/lost_item_details_page.dart';
import 'package:lost_found/features/main/widgets/cards.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';
import 'package:lost_found/features/main/widgets/get_found_time_difference.dart';
import 'package:lost_found/features/main/widgets/get_lost_time_difference.dart';

class BrowseItem extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const BrowseItem());
  const BrowseItem({super.key});

  @override
  State<BrowseItem> createState() => _BrowseItemState();
}

String keyword = "";

class _BrowseItemState extends State<BrowseItem> {
  @override
  void initState() {
    super.initState();
    // context.read<BackendInformationBloc>().add(BackendLostInformationBloc());
    // context.read<BackendInformationBloc>().add(BackendFoundInformationBloc());
    context.read<BackendInformationBloc>().add(BackendItemInformationBloc());
  }

  void _runFilter(String enteredKeyword) {
    setState(() {
      keyword = enteredKeyword;
    });
  }

  bool searchConditions(CombinedLostFound itemList) {
    bool lowercase = false;
    bool uppercase = false;

    if (itemList.description.toLowerCase().contains(keyword) ||
        itemList.title.toLowerCase().contains(keyword)) {
      lowercase = true;
    }

    if (itemList.description.toUpperCase().contains(keyword) ||
        itemList.title.toUpperCase().contains(keyword)) {
      uppercase = true;
    }

    return lowercase || uppercase;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: AppPallete.lightGrey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  buildHeading("Browse reported items",
                      color: AppPallete.blackColor),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppPallete.greyColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      onChanged: (value) => _runFilter(value),
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        hintText: 'Search',
                        suffixIcon: Icon(
                          Icons.search,
                          color: AppPallete.lightPurple,
                          size: 30,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          // const Cards(
          //   title: "Notebook and Pen",
          //   description:
          //       "Left my notebook & Pen In meeting room no 5. It has important client Meeting notes",
          //   user: "Deepika",
          //   time: "3 hrs ago",
          //   imageUrl:
          //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfF2YcEpt1vTuV0UF4jSdhV-sVrvp3lo1y9kPsSTtCxw&s",
          //   status: "Claimed",
          //   color: AppPallete.claimedColor,
          //   textColor: AppPallete.whiteColor,
          //   fontSize: 13.0,
          // ),

          // Items Collection
          BlocConsumer<BackendInformationBloc, BackendInformationState>(
            listener: (context, state) {
              if (state is BackendInformationFailure) {
                showSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is BackendInformationLoading) {
                return const Loader();
              }
              if (state is BackendInformationSuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.item.length,
                  itemBuilder: (context, index) {
                    final itemList = state.item[index];

                    Map<String, int> timeDiff = getLostTimeDifference(
                        itemList.lostDate,
                        itemList.lostTime,
                        itemList.updatedAt);
                    String timeText = "";

                    Map<String, int> foundTimeDiff =
                        getFoundTimeDifference(itemList.updatedAt);
                    String foundTimeText = foundTimeDiff.keys.first;

                    if (itemList.status == "Lost") {
                      timeText = timeDiff.keys.first;
                    } else {
                      foundTimeText = foundTimeDiff.keys.first;
                    }

                    if (keyword != "") {
                      if (searchConditions(itemList)) {
                        return DisplayCards(
                          itemList: itemList,
                          timeText: timeText,
                          foundTimeText: foundTimeText,
                        );
                      } else {
                        return const SizedBox();
                      }
                    } else {
                      if (itemList.status == "Claimed") {
                        Map<String, int> claimedTimeDiff =
                            getFoundTimeDifference(itemList.claimedTime!);
                        String claimedTimeText = claimedTimeDiff.keys.first;

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              ClaimedItemDetailsPage.route(
                                  itemList.posterName!,
                                  claimedTimeText,
                                  itemList.imageUrl,
                                  itemList.title,
                                  itemList.category,
                                  itemList.description,
                                  itemList.location,
                                  itemList.claimedTime!,
                                  itemList.collectionCenter!,
                                  itemList.posterId!,
                                  itemList.id),
                            );
                          },
                          child: Cards(
                            title: itemList.title,
                            description: itemList.description,
                            user: itemList.posterName!,
                            time: foundTimeText,
                            imageUrl: itemList.imageUrl,
                            status: itemList.status,
                            color: AppPallete.claimedColor,
                            fontSize: itemList.claimed ? 13.0 : 16.0,
                          ),
                        );
                      } else {
                        return DisplayCards(
                          itemList: itemList,
                          timeText: timeText,
                          foundTimeText: foundTimeText,
                        );
                      }
                    }
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

class DisplayCards extends StatelessWidget {
  final CombinedLostFound itemList;
  final String timeText;
  final String foundTimeText;

  const DisplayCards({
    super.key,
    required this.itemList,
    required this.timeText,
    required this.foundTimeText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          itemList.status == "Lost"
              ? LostItemDetailsPage.route(
                  itemList.posterName!,
                  timeText,
                  itemList.imageUrl,
                  itemList.title,
                  itemList.category,
                  itemList.description,
                  itemList.location,
                  itemList.lostDate!,
                  itemList.lostTime!,
                  itemList.posterId!,
                )
              : FoundItemDetailsPage.route(
                  itemList.posterName!,
                  foundTimeText,
                  itemList.imageUrl,
                  itemList.title,
                  itemList.category,
                  itemList.description,
                  itemList.location,
                  itemList.updatedAt,
                  itemList.collectionCenter!,
                  itemList.posterId!,
                  itemList.id,
                ),
        );
      },
      child: Cards(
        title: itemList.title,
        description: itemList.description,
        user: itemList.posterName!,
        time: itemList.status == "Lost" ? timeText : foundTimeText,
        imageUrl: itemList.imageUrl,
        status: itemList.status,
        color: itemList.claimed == false
            ? (itemList.status == "Lost"
                ? AppPallete.lostColor
                : AppPallete.foundColor)
            : AppPallete.claimedColor,
        fontSize: itemList.claimed ? 13.0 : 16.0,
      ),
    );
  }
}
