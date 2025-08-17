import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Core/cubits/Reports_CUBIT/reports_cubit.dart';
import 'package:project/Presentation/ReportsPage/MonthlyReportsPage/CustomMonthPidkcer.dart';
import 'package:project/Presentation/ReportsPage/baseReportsScreen.dart';

class MonthlyReportsScreen extends StatefulWidget {
  const MonthlyReportsScreen({super.key});

  @override
  State<MonthlyReportsScreen> createState() => _MonthlyReportsScreenState();
}

class _MonthlyReportsScreenState extends State<MonthlyReportsScreen> {
  String? selectedMonth;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportsCubit(Dio()),
      child: BaseReportsScreen(
        title: 'النشرات والتقارير الشهرية',
        statementStatus: '2',
        buildDatePicker: (fromDate, toDate, onDateChanged) {
          return CustomMonthPickerField(
            selectedMonth: selectedMonth,
            onMonthSelected: (monthLabel, from, to) {
              setState(() {
                selectedMonth = monthLabel;
              });
              onDateChanged(from, to); // نرجع التواريخ للـ BaseReportsScreen
            },
          );
        },
      ),
    );
  }
}
