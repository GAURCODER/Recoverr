import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/common/widgets/text_description_widget.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/utils/show_snackbar.dart';
import 'package:lost_found/features/components/backend/presentation/bloc/backend_information_bloc.dart';
import 'package:lost_found/features/main/index_page.dart';
import 'package:lost_found/features/main/views/recommendation_page.dart';
import 'package:lost_found/features/main/widgets/cards.dart';
import 'package:lost_found/features/main/widgets/get_found_time_difference.dart';
import 'package:lost_found/features/main/widgets/get_lost_time_difference.dart';
import 'package:lost_found/features/main/widgets/title_bar.dart';

class PersonalItems extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const PersonalItems());
  const PersonalItems({super.key});

  @override
  State<PersonalItems> createState() => _PersonalItemsState();
}

class _PersonalItemsState extends State<PersonalItems> {
  int myItems = 0;

  @override
  void initState() {
    super.initState();
    // context.read<BackendInformationBloc>().add(BackendLostInformationBloc());
    // context.read<BackendInformationBloc>().add(BackendFoundInformationBloc());
    context.read<BackendInformationBloc>().add(BackendItemInformationBloc());
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId =
        (context.read<AppUserCubit>().state as AppUserLoggedIn).user.id;

    return Scaffold(
      body: ListView(
        children: [
          TitleBar(
            title: "Items reported",
            onTap: () {
              Navigator.push(context, IndexPage.route());
            },
          ),

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
                myItems = state.item
                    .where((item) => item.userId == currentUserId)
                    .length;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.item.length,
                  itemBuilder: (context, index) {
                    final itemList = state.item[index];

                    if (itemList.userId == currentUserId ||
                        itemList.claimedId == currentUserId) {
                      String timeText = getLostTimeDifference(itemList.lostDate,
                              itemList.lostTime, itemList.updatedAt)
                          .keys
                          .first;
                      String foundTimeText =
                          getFoundTimeDifference(itemList.updatedAt).keys.first;

                      if (itemList.status == "Lost") {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              RecommendationPage.route(
                                itemList.id,
                                itemList.imageUrl,
                                itemList.title,
                                itemList.description,
                                itemList.category,
                                itemList.status,
                              ),
                            );
                          },
                          child: Cards(
                            title: itemList.title,
                            description: itemList.description,
                            user: itemList.posterName!,
                            time: timeText,
                            imageUrl: itemList.imageUrl,
                            status: itemList.status,
                            color: (itemList.claimed == false)
                                ? AppPallete.lostColor
                                : AppPallete.claimedColor,
                            fontSize: (itemList.claimed == true) ? 13.0 : 16.0,
                          ),
                        );
                      } else if (itemList.status == "Claimed") {
                        String claimedTimeText =
                            getFoundTimeDifference(itemList.claimedTime!)
                                .keys
                                .first;

                        return Cards(
                          title: itemList.title,
                          description: itemList.description,
                          user: "",
                          time: claimedTimeText,
                          imageUrl: itemList.imageUrl,
                          status: itemList.status,
                          color: AppPallete.claimedColor,
                          fontSize: 13.0,
                          claimedItem: true,
                          claimedText: "Claimed by you",
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              RecommendationPage.route(
                                itemList.id,
                                itemList.imageUrl,
                                itemList.title,
                                itemList.description,
                                itemList.category,
                                itemList.status,
                              ),
                            );
                          },
                          child: Cards(
                            title: itemList.title,
                            description: itemList.description,
                            user: itemList.posterName!,
                            time: foundTimeText,
                            imageUrl: itemList.imageUrl,
                            status: itemList.status,
                            color: (itemList.claimed == false)
                                ? AppPallete.foundColor
                                : AppPallete.claimedColor,
                            fontSize: (itemList.claimed == true) ? 13.0 : 16.0,
                          ),
                        );
                      }
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              }
              return (myItems == 0)
                  ? const NoReportedItems()
                  : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

class NoReportedItems extends StatelessWidget {
  const NoReportedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        buildDescription(
          "Don't worry you have no lost items",
          fontSize: 18,
        )
      ],
    );
  }
}
