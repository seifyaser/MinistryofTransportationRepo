import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:project/Core/cubits/Reports_CUBIT/reports_States.dart';
import 'package:project/models/ReportsModel.dart';


class ReportsCubit extends Cubit<ReportsState> {
  final Dio dio;

  ReportsCubit(this.dio) : super(ReportsInitial());

  Future<void> fetchReports({
    required String fromDate,
    required String toDate,
    required String statementStatus,
  }) async {
    final baseUrl = 'http://41.33.148.248:5555/api/Reports/v2/document_attachment_proce';

    emit(ReportsLoading());

    try {
      final response = await dio.get(
        baseUrl,
        queryParameters: {
          'fromDate': fromDate,
          'toDate': toDate,
          'StatementStatus': statementStatus,
        },
      );

      if (response.statusCode == 200) {
        final data = ReportsResponse.fromJson(response.data);
        if (data.isSuccess) {
          emit(ReportsLoaded(data));
        } else {
          emit(ReportsError(data.error ?? 'حدث خطأ غير معروف'));
        }
      } else {
        emit(ReportsError('خطأ في الاستجابة: ${response.statusCode}'));
      }
    } catch (e) {
      emit(ReportsError('حدث خطأ: $e'));
    }
  }
}
