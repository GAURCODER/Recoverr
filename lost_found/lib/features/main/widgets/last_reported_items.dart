import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/utils/show_snackbar.dart';
import 'package:lost_found/features/components/backend/presentation/bloc/backend_information_bloc.dart';
import 'package:lost_found/features/components/found/presentation/pages/found_item_details_page.dart';
import 'package:lost_found/features/components/lost/presentation/pages/lost_item_details_page.dart';
import 'package:lost_found/features/main/widgets/get_found_time_difference.dart';
import 'package:lost_found/features/main/widgets/get_lost_time_difference.dart';
import 'package:lost_found/features/main/widgets/small_card.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';

class LastReportedItems extends StatefulWidget {
  const LastReportedItems({super.key});

  @override
  State<LastReportedItems> createState() => _LastReportedItemsState();
}

class _LastReportedItemsState extends State<LastReportedItems> {
  @override
  void initState() {
    super.initState();
    context.read<BackendInformationBloc>().add(BackendItemInformationBloc());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPallete.greyShade200,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildHeading(
                  "Reported items in last 48hrs",
                  fontSize: 17,
                  bold: true,
                  color: AppPallete.blackColor,
                ),
                // GestureDetector(
                //   onTap: () {},
                //   child: const Icon(
                //     Icons.search,
                //     size: 35,
                //   ),
                // ),
              ],
            ),
          ),
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
                List<Widget> cards = [];
                for (var item in state.item) {
                  // String timeText = timeDiff.keys.first;
                  // int? duration = timeDiff[timeText];

                  // String timeText = "";
                  // int? duration = 0;

                  Map<String, int> timeDiff = getLostTimeDifference(
                      item.lostDate, item.lostTime, item.updatedAt);

                  String timeText = timeDiff.keys.first;
                  int? duration = timeDiff[timeText];

                  Map<String, int> foundTimeDiff =
                      getFoundTimeDifference(item.updatedAt);
                  String foundTimeText = foundTimeDiff.keys.first;
                  int? foundDuration = foundTimeDiff[foundTimeText];

                  // String foundTimeText = "";
                  // int? foundDuration = 0;

                  if (item.status == "Lost") {
                    foundDuration = null;
                  } else if (item.status == "Found") {
                    duration = null;
                  } else {
                    duration = null;
                    foundDuration = null;
                  }

                  if (item.claimed == false &&
                      (checkCondition(
                          duration, timeText, foundDuration, foundTimeText))) {
                    cards.add(
                      GestureDetector(
                        onTap: () {
                          if (item.status == "Lost") {
                            Navigator.push(
                              context,
                              LostItemDetailsPage.route(
                                item.posterName!,
                                timeText,
                                item.imageUrl,
                                item.title,
                                item.category,
                                item.description,
                                item.location,
                                item.lostDate!,
                                item.lostTime!,
                                item.posterId!,
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              FoundItemDetailsPage.route(
                                item.posterName!,
                                timeText,
                                item.imageUrl,
                                item.title,
                                item.category,
                                item.description,
                                item.location,
                                item.updatedAt,
                                item.collectionCenter!,
                                item.posterId!,
                                item.id,
                              ),
                            );
                          }
                        },
                        child: SmallCard(
                          imageUrl: item.imageUrl,
                          status: item.status,
                          title: item.title,
                          location: item.location,
                          postedBy: item.posterName!,
                          time: (item.status == "Lost")
                              ? timeText
                              : foundTimeText,
                          color: (item.status == "Lost")
                              ? AppPallete.lostColor
                              : AppPallete.foundColor,
                        ),
                      ),
                    );
                  }
                }
                return Wrap(
                  children: cards,
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}

bool checkCondition(
    int? duration, String timeText, int? foundDuration, String foundTimeText) {
  bool lostCheck = false;
  bool foundCheck = false;

  // print("duration --> $duration");
  // print("timeText --> $timeText");
  // print("foundDuration --> $foundDuration");
  // print("foundTimeText --> $foundTimeText");

  if (duration != null) {
    if (duration >= 5 && duration <= 7) lostCheck = true;
    if (duration == 8) {
      if (timeText[1] == " " && int.parse(timeText.substring(0, 1)) <= 48) {
        lostCheck = true;
      } else {
        lostCheck = (int.parse(timeText.substring(0, 2)) <= 48);
      }
    }
    if (duration == 9) {
      if (timeText[1] == " " && int.parse(timeText.substring(0, 1)) <= 2) {
        lostCheck = true;
      }
    }
    if (duration == 10) {
      if (timeText[1] == " " && int.parse(timeText.substring(0, 1)) <= 2) {
        lostCheck = true;
      }
    }
  }

  if (foundDuration != null) {
    if (foundDuration >= 5 && foundDuration <= 7) {
      foundCheck = true;
    }

    if (foundDuration == 8) {
      if (foundTimeText[1] == " " &&
          int.parse(foundTimeText.substring(0, 1)) <= 48) {
        foundCheck = true;
      } else {
        foundCheck = (int.parse(foundTimeText.substring(0, 2)) <= 48);
      }
    }

    if (foundDuration == 9) {
      if (foundTimeText[1] == " " &&
          int.parse(foundTimeText.substring(0, 1)) <= 2) {
        foundCheck = true;
      }
    }
    if (foundDuration == 10) {
      if (foundTimeText[1] == " " &&
          int.parse(foundTimeText.substring(0, 1)) <= 2) {
        foundCheck = true;
      }
    }
  }

  return lostCheck || foundCheck;
}
