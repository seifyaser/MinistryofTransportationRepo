import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDailyDatePickerField extends StatelessWidget {
  final DateTime? selectedDate;
  final void Function(DateTime) onDateSelected;
  final String hintText;

  const CustomDailyDatePickerField({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
    this.hintText = 'اختر التاريخ',
  }) : super(key: key);

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(now.year - 5),
      lastDate: now,
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateText = selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(selectedDate!)
        : hintText;

    return InkWell(
      onTap: () => _pickDate(context),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.grey),
            const SizedBox(width: 8),
            Text(
              dateText,
              style: TextStyle(
                color: selectedDate == null ? Colors.grey : Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
