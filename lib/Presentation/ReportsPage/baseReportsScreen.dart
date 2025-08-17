import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project/Core/cubits/Reports_CUBIT/reports_States.dart';
import 'package:project/Core/cubits/Reports_CUBIT/reports_cubit.dart';
import 'package:project/Presentation/PDFviewerScreen/pdfViewerScreen.dart';
import 'package:project/Widgets/CustomHeader.dart';

class BaseReportsScreen extends StatefulWidget {
  final String title;
  final String statementStatus;

  final Widget Function(DateTime? fromDate, DateTime? toDate,
      void Function(DateTime from, DateTime to) onDateChanged) buildDatePicker;

  const BaseReportsScreen({
    super.key,
    required this.title,
    required this.statementStatus,
    required this.buildDatePicker,
  });

  @override
  State<BaseReportsScreen> createState() => _BaseReportsScreenState();
}

class _BaseReportsScreenState extends State<BaseReportsScreen> {
  DateTime? fromDate;
  DateTime? toDate;

  void _updateDates(DateTime from, DateTime to) {
    setState(() {
      fromDate = from;
      toDate = to;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(title: widget.title),
          Padding(
            padding: const EdgeInsets.all(12),
            child: widget.buildDatePicker(fromDate, toDate, _updateDates),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                if (fromDate != null && toDate != null) {
                  final from = DateFormat('yyyy-MM-dd').format(fromDate!);
                  final to = DateFormat('yyyy-MM-dd').format(toDate!);

                  context.read<ReportsCubit>().fetchReports(
                        fromDate: from,
                        toDate: to,
                        statementStatus: widget.statementStatus,
                      );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('يرجى اختيار التاريخ أولاً')),
                  );
                }
              },
              child: const Text('بحث'),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<ReportsCubit, ReportsState>(
              builder: (context, state) {
                if (state is ReportsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ReportsLoaded) {
                  final files = state.reportsResponse.data;
                  if (files.isEmpty) {
                    return const Center(child: Text('لا توجد ملفات لعرضها'));
                  }
                  return ListView.builder(
                    itemCount: files.length,
                    itemBuilder: (context, index) {
                      final file = files[index];
                      return ListTile(
                        title: Text(file.fileTitle),
                        subtitle: Text(file.fileDescription),
                        trailing: const Icon(Icons.picture_as_pdf),
                        onTap: () {
                          final attachmentId = file.attachmentContentId;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PdfViewerScreen(
                                pdfUrl:
                                    'http://41.33.148.248:5555/api/Reports/report-pdf/$attachmentId',
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (state is ReportsError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return const Center(
                  child: Text(
                    'لا تقارير لعرضها',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
