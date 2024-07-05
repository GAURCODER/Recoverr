import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/common/widgets/item_possible_category.dart';

class ItemCategory extends StatefulWidget {
  final TextEditingController controller;
  const ItemCategory({super.key, required this.controller});

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.greyColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Additional details",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Category (This will help in getting better match)",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Wrap(
              children: [
                ItemPossibleCategory(
                  text: "Stationary",
                  controller: widget.controller,
                  isSelected: selectedCategory == "Stationary",
                  onTap: () {
                    setState(() {
                      selectedCategory = "Stationary";
                      widget.controller.text = selectedCategory;
                    });
                  },
                ),
                ItemPossibleCategory(
                  text: "Gadget",
                  controller: widget.controller,
                  isSelected: selectedCategory == "Gadget",
                  onTap: () {
                    setState(() {
                      selectedCategory = "Gadget";
                      widget.controller.text = selectedCategory;
                    });
                  },
                ),
                ItemPossibleCategory(
                  text: "Keys",
                  controller: widget.controller,
                  isSelected: selectedCategory == "Keys",
                  onTap: () {
                    setState(() {
                      selectedCategory = "Keys";
                      widget.controller.text = selectedCategory;
                    });
                  },
                ),
                ItemPossibleCategory(
                  text: "Purse",
                  controller: widget.controller,
                  isSelected: selectedCategory == "Purse",
                  onTap: () {
                    setState(() {
                      selectedCategory = "Purse";
                      widget.controller.text = selectedCategory;
                    });
                  },
                ),
                ItemPossibleCategory(
                  text: "Others",
                  controller: widget.controller,
                  isSelected: selectedCategory == "Others",
                  onTap: () {
                    setState(() {
                      selectedCategory = "Others";
                      widget.controller.text = selectedCategory;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
