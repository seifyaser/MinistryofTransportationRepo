import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class CustomMonthPickerField extends StatelessWidget {
  final String? selectedMonth;
  final Function(String monthLabel, DateTime from, DateTime to) onMonthSelected;

  const CustomMonthPickerField({
    Key? key,
    this.selectedMonth,
    required this.onMonthSelected,
  }) : super(key: key);

  void _showMonthPicker(BuildContext context) async {
    final now = DateTime.now();

    final DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    
    );

    if (picked != null) {
      final from = DateTime(picked.year, picked.month, 1);
      final to = DateTime(picked.year, picked.month + 1, 0);

      final monthLabel = "${_arabicMonths[picked.month - 1]} ${picked.year}";
      onMonthSelected(monthLabel, from, to);
    }
  }

  static const List<String> _arabicMonths = [
    "يناير",
    "فبراير",
    "مارس",
    "أبريل",
    "مايو",
    "يونيو",
    "يوليو",
    "أغسطس",
    "سبتمبر",
    "أكتوبر",
    "نوفمبر",
    "ديسمبر"
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMonthPicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedMonth ?? "اختار الشهر",
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
