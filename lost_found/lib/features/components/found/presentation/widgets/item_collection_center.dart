import 'package:flutter/material.dart';

class ItemCollectionCenter extends StatelessWidget {
  final String selectedItem;
  final ValueChanged<String?> onChanged;

  const ItemCollectionCenter({
    super.key,
    required this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 330,
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedItem,
                onChanged: onChanged,
                items: <String>[
                  "Security",
                  "Reception",
                  "Ground",
                  "Lab",
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
