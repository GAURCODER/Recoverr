import 'package:flutter/material.dart';

class TimeSelector extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const TimeSelector({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  bool isTimeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      height: 40.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: isTimeSelected == false ? widget.labelText : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.access_time),
            onPressed: () async {
              final TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                setState(() {
                  widget.controller.text = pickedTime.format(context);
                  isTimeSelected = true;
                });
              }
            },
          ),
        ),
        readOnly: true,
      ),
    );
  }
}
