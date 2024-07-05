import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/common/widgets/item_suggestion_location_list.dart';

class ItemSuggestedLocation extends StatefulWidget {
  final String description;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  const ItemSuggestedLocation({
    super.key,
    required this.description,
    required this.controller,
    required this.formKey,
  });

  @override
  State<ItemSuggestedLocation> createState() => _ItemSuggestedLocationState();
}

class _ItemSuggestedLocationState extends State<ItemSuggestedLocation> {
  String selectedLocation = "";
  final String hintText = "Please select a location";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.0,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.greyColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: selectedLocation.isEmpty
                  ? widget.description
                  : selectedLocation,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            onChanged: (value) {
              widget.formKey.currentState?.validate();
            },
            validator: (value) {
              if (selectedLocation == "") {
                return hintText;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ItemSuggestedLocationLists(
                  iconData: Icons.local_parking,
                  text: "Parking",
                  controller: widget.controller,
                  isSelected: selectedLocation == "Parking",
                  onTap: () {
                    setState(() {
                      selectedLocation = "Parking";
                      widget.controller.text = selectedLocation;
                      widget.formKey.currentState?.validate();
                    });
                  },
                ),
                ItemSuggestedLocationLists(
                  iconData: Icons.kitchen,
                  text: "Mess",
                  controller: widget.controller,
                  isSelected: selectedLocation == "Mess",
                  onTap: () {
                    setState(() {
                      selectedLocation = "Mess";
                      widget.controller.text = selectedLocation;
                      widget.formKey.currentState?.validate();
                    });
                  },
                ),
                ItemSuggestedLocationLists(
                  iconData: Icons.school,
                  text: "Classroom",
                  controller: widget.controller,
                  isSelected: selectedLocation == "Classroom",
                  onTap: () {
                    setState(() {
                      selectedLocation = "Classroom";
                      widget.controller.text = selectedLocation;
                      widget.formKey.currentState?.validate();
                    });
                  },
                ),
                ItemSuggestedLocationLists(
                  iconData: Icons.sports_basketball,
                  text: "Ground",
                  controller: widget.controller,
                  isSelected: selectedLocation == "Ground",
                  onTap: () {
                    setState(() {
                      selectedLocation = "Ground";
                      widget.controller.text = selectedLocation;
                      widget.formKey.currentState?.validate();
                    });
                  },
                ),
                ItemSuggestedLocationLists(
                  iconData: Icons.device_unknown,
                  text: "Forgot?",
                  controller: widget.controller,
                  isSelected: selectedLocation == "Forgot?",
                  onTap: () {
                    setState(() {
                      selectedLocation = "Forgot?";
                      widget.controller.text = selectedLocation;
                      widget.formKey.currentState?.validate();
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
