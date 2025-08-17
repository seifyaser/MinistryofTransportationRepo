import 'package:flutter/material.dart';
import 'package:project/Presentation/ReportsPage/DailyReportsPage/Widgets/CustomDailyDatePickerField.dart';
import 'package:project/Widgets/CustomHeader.dart';

class YearReportsScreen extends StatefulWidget {
  const YearReportsScreen({super.key});

  @override
  State<YearReportsScreen> createState() => _YearReportsScreenState();
}

class _YearReportsScreenState extends State<YearReportsScreen> {
    DateTime? fromDate;
  DateTime? toDate;


  @override
  Widget build(BuildContext context) {
    final bool hasReports = false;

    return Scaffold(
      body: Column(
        children: [
          CustomHeader(title: 'النشرات والتقارير سنوية'),
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomDailyDatePickerField(
                    selectedDate: fromDate,
                onDateSelected: (date) {
                setState(() {
                  fromDate = date;
                  toDate = date;  // نفس التاريخ
                });
              },
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Center(
              child: Text(
                hasReports ? 'تقارير ستظهر هنا' : 'لا تقارير لعرضها',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
