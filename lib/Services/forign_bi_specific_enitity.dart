import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project/models/forign_entity_income_model.dart';


class BiSpecificEntity {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://41.33.148.248:5555/api';


  Future<List<EntityIncome>> getSpecificEntityIncome({
    required String fromDate,
    required String toDate,
    required int statementStatus,
    required String userName,
    required String token,
  }) async {
    final response = await _dio.get(
      '$_baseUrl/Reports/v2/bi_specific_entity_income_proce',
      queryParameters: {
        'fromDate': fromDate,
        'toDate': toDate,
        'StatementStatus': statementStatus,
        'UserName': userName,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode != 200) throw Exception(response.statusCode);
    log(response.data.toString());

    final dataList = response.data['data'] as List;
    return dataList.map((json) => EntityIncome.fromJson(json)).toList();
  }
}
