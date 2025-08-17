import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Core/cubits/Reports_CUBIT/reports_cubit.dart';
import 'package:project/Presentation/ReportsPage/baseReportsScreen.dart';
import 'package:project/Presentation/ReportsPage/DailyReportsPage/Widgets/CustomDailyDatePickerField.dart';

class DailyReportsScreen extends StatelessWidget {
  const DailyReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportsCubit(Dio()),
      child: BaseReportsScreen(
        title: 'النشرات والتقارير اليومية',
        statementStatus: '1',
        buildDatePicker: (fromDate, toDate, onDateChanged) {
          return CustomDailyDatePickerField(
            selectedDate: fromDate,
            onDateSelected: (date) {
           
              onDateChanged(date, date);
            },
          );
        },
      ),
    );
  }
}
