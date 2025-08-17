import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Core/cubits/Reports_CUBIT/reports_cubit.dart';
import 'package:project/Presentation/ReportsPage/baseReportsScreen.dart';
import 'package:project/Presentation/ReportsPage/halfYearReportsPage/widgets/CustomHalfYearDatePicker.dart';

class HalfYearReportsScreen extends StatefulWidget {
  const HalfYearReportsScreen({super.key});

  @override
  State<HalfYearReportsScreen> createState() => _HalfYearReportsScreenState();
}

class _HalfYearReportsScreenState extends State<HalfYearReportsScreen> {
  String? selectedHalf;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportsCubit(Dio()),
      child: BaseReportsScreen(
        title: 'النشرات والتقارير النصف سنوية',
        statementStatus: '5',
        buildDatePicker: (fromDate, toDate, onDateChanged) {
          return CustomHalfYearPickerField(
            selectedHalfYear: selectedHalf, 
            onHalfSelected: (half, from, to) {
              setState(() {
                selectedHalf = half; 
              });
              onDateChanged(from, to);
            },
          );
        },
      ),
    );
  }
}
