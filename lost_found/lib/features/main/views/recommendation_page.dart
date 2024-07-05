import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/utils/generate_label.dart';
import 'package:lost_found/core/utils/show_snackbar.dart';
import 'package:lost_found/core/utils/show_toast.dart';
import 'package:lost_found/features/components/backend/presentation/bloc/backend_information_bloc.dart';
import 'package:lost_found/features/main/widgets/get_found_time_difference.dart';
import 'package:lost_found/features/main/widgets/get_lost_time_difference.dart';
import 'package:lost_found/features/main/widgets/lost_found_personal_item.dart';
import 'package:lost_found/features/main/widgets/recommended_card.dart';

class RecommendationPage extends StatefulWidget {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final String category;
  final String status;

  const RecommendationPage({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
  });

  static MaterialPageRoute route(
    String id,
    String imageUrl,
    String title,
    String description,
    String category,
    String status,
  ) {
    return MaterialPageRoute(
      builder: (context) => RecommendationPage(
        id: id,
        imageUrl: imageUrl,
        title: title,
        description: description,
        category: category,
        status: status,
      ),
    );
  }

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  late Future<void> _loadModelFuture;
  List<Map<dynamic, dynamic>> itemList = [];
  List recomendedCards = [];
  late String currentItemLabel = "";

  @override
  void initState() {
    super.initState();
    context.read<BackendInformationBloc>().add(BackendItemInformationBloc());
    _loadModelFuture = loadModel();
  }

  loadModel() async {
    currentItemLabel = await getItemLabel(widget.imageUrl);
    for (var items in itemList) {
      var id = items['id'];
      var imageUrl = items['imageUrl'];

      String timeText = "";
      String foundTimeText = "";

      if (widget.id != id) {
        if (widget.status == "Lost") {
          foundTimeText =
              getFoundTimeDifference(items['updated_at']).keys.first;
        } else if (widget.status == "Found") {
          timeText = getLostTimeDifference(
                  items['lostDate'], items['lostTime'], items['updated_at'])
              .keys
              .first;
        }

        String label = await getItemLabel(imageUrl!);
        if (label == currentItemLabel) {
          if (widget.status == "Lost" && items['status'] == "Found") {
            recomendedCards.add({
              'id': id,
              'imageUrl': imageUrl,
              'title': items['title'],
              'description': items['description'],
              'category': items['category'],
              'postedBy': items['postedBy'],
              'timeAgo': foundTimeText,
              'status': items['status']
            });
          }
          if (widget.status == "Found" && items['status'] == "Lost") {
            recomendedCards.add({
              'id': id,
              'imageUrl': imageUrl,
              'title': items['title'],
              'description': items['description'],
              'category': items['category'],
              'postedBy': items['postedBy'],
              'timeAgo': timeText,
              'status': items['status']
            });
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: AppPallete.greyShade300,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 20),
                  buildHeading(
                    "Items reported",
                    color: AppPallete.blackColor,
                    fontSize: 20,
                    bold: false,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),

          LostFoundPersonalItem(
            imageUrl: widget.imageUrl,
            title: widget.title,
            description: widget.description,
            category: widget.category,
            status: widget.status,
          ),

          const SizedBox(height: 10),

          // Horizontal line
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppPallete.greyShade300),
            ),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
            width: double.infinity,
            child: buildHeading(
              "Best match for your item",
              color: AppPallete.blackColor,
              fontSize: 24,
              bold: false,
            ),
          ),

          BlocConsumer<BackendInformationBloc, BackendInformationState>(
            listener: (context, state) {
              if (state is BackendInformationFailure) {
                showSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is BackendInformationSuccess) {
                List<Map<String, String>> itemInformation = [];
                for (var items in state.item) {
                  itemInformation.add({
                    'id': items.id,
                    'imageUrl': items.imageUrl,
                  });
                }

                itemList = itemInformation;
                loadModel();
              }
              return const SizedBox();
            },
          ),

          BlocConsumer<BackendInformationBloc, BackendInformationState>(
            listener: (context, state) {
              if (state is BackendInformationFailure) {
                showSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is BackendInformationSuccess) {
                List<Map<dynamic, dynamic>> itemInformation = [];
                for (var items in state.item) {
                  if (items.status != "Claimed") {
                    itemInformation.add({
                      'id': items.id,
                      'imageUrl': items.imageUrl,
                      'title': items.title,
                      'description': items.description,
                      'category': items.category,
                      'postedBy': items.posterName!,
                      'lostDate': items.lostDate!,
                      'lostTime': items.lostTime!,
                      'status': items.status,
                      'updated_at': items.updatedAt,
                    });
                  }
                }

                itemList = itemInformation;
              }
              return const SizedBox();
            },
          ),

          FutureBuilder(
            future: _loadModelFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              } else if (snapshot.hasError) {
                showToast(text: snapshot.error.toString(), context: context);
              } else {
                for (var items in recomendedCards) {
                  return RecommendedCards(
                    imageUrl: items['imageUrl'],
                    title: items['title'],
                    description: items['description'],
                    category: items['category'],
                    postedBy: items['postedBy'],
                    timeText: items['timeAgo'],
                    status: items['status'],
                  );
                }

                if (recomendedCards.isEmpty) {
                  showToast(text: "No matching items", context: context);
                }
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
