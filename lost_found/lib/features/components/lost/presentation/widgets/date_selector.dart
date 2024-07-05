import 'package:intl/intl.dart'; // Add this import at the top of your file
import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const DateSelector({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime? selectedDate;
  DateTime endDate = DateTime.now();

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
        readOnly: true,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: selectedDate == null ? widget.labelText : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: endDate,
              );
              if (pickedDate != null && pickedDate != selectedDate) {
                setState(() {
                  selectedDate = pickedDate;
                  // Format the date in DD/MM/YYYY format
                  widget.controller.text =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
