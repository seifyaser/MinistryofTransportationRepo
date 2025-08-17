import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Core/cubits/Reports_CUBIT/reports_cubit.dart';
import 'package:project/Presentation/ReportsPage/baseReportsScreen.dart';
import 'package:project/Presentation/ReportsPage/qaurtYearpage/QuarterYearDatepicker.dart';

class QuartYearReportsScreen extends StatelessWidget {
  const QuartYearReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportsCubit(Dio()),
      child: BaseReportsScreen(
        title: 'النشرات والتقارير الربع سنوي',
        statementStatus: '4',
        buildDatePicker: (fromDate, toDate, onDateChanged) {
          return QuarterlyPickerButton();

        },
      ),
    );
  }
}
