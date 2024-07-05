import 'package:flutter/material.dart';
import 'package:lost_found/features/components/lost/presentation/widgets/date_selector.dart';
import 'package:lost_found/features/components/lost/presentation/widgets/time_selector.dart';

class ItemLostTime extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController timeController;

  const ItemLostTime({
    super.key,
    required this.dateController,
    required this.timeController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose approx Date & Time",
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateSelector(
                  labelText: 'Select Date',
                  controller: dateController,
                ),
                TimeSelector(
                  labelText: 'Select Time',
                  controller: timeController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
