import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Core/cubits/specific_entity_income/specific_entity_income_state.dart';
import 'package:project/models/SpeicficEnitiyModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpecificEntityCubit extends Cubit<SpecificEntityIncomeState> {
  SpecificEntityCubit() : super(SpecificEntityIncomeInitial());

  final Dio _dio = Dio();
  final String _baseUrl = 'http://41.33.148.248:5555/api';

  Future<void> fetchSpecificEntityData({
    required String fromDate,
    required String toDate,
    int statementStatus = 1,
  }) async {
    emit(SpecificEntityIncomeLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId') ?? '';
      final token = prefs.getString('token') ?? '';

      final response = await _dio.get(
        '$_baseUrl/Reports/v2/specific_entity_income_proce',
        queryParameters: {
          'fromDate': fromDate,
          'toDate': toDate,
          'StatementStatus': statementStatus,
          'UserName': userId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final data = SpecificEntityModel.fromJson(response.data);
      emit(SpecificEntityIncomeLoaded(data));
    } on DioException catch (e) {
      emit(SpecificEntityIncomeError(
        e.response?.data?.toString() ?? 'خطأ في الاتصال بالسيرفر',
      ));
    } catch (e) {
      emit(SpecificEntityIncomeError('حدث خطأ غير متوقع: ${e.toString()}'));
    }
  }
}
