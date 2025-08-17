import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Core/cubits/Reports_CUBIT/reports_cubit.dart';
import 'package:project/Presentation/ReportsPage/baseReportsScreen.dart';
import 'package:project/Presentation/ReportsPage/qaurtYearpage/QuarterYearDatepicker.dart';

class QuartYearReportsScreen extends StatefulWidget {
  const QuartYearReportsScreen({super.key});

  @override
  State<QuartYearReportsScreen> createState() => _QuartYearReportsScreenState();
}

class _QuartYearReportsScreenState extends State<QuartYearReportsScreen> {
  String? selectedQuarter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportsCubit(Dio()),
      child: BaseReportsScreen(
        title: 'النشرات والتقارير الربع سنوي',
        statementStatus: '4',
        buildDatePicker: (fromDate, toDate, onDateChanged) {
          return CustomQuarterlyPickerField(
            selectedQuarter: selectedQuarter, 
            onQuarterSelected: (quarter, from, to) {
              setState(() {
                selectedQuarter = quarter; 
              });
              onDateChanged(from, to);
            },
          );
        },
      ),
    );
  }
}
