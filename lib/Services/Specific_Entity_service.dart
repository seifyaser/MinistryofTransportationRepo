// import 'package:dio/dio.dart';
// import 'package:project/models/SpeicficEnitiyModel.dart';

// class SpecificEntityService {
//   final Dio _dio = Dio();
//   final String _baseUrl = 'http://41.33.148.248:5555/api';

//   Future<SpecificEntityModel> fetchSpecificEntityData({
//     required String fromDate,
//     required String toDate,
//     required int statementStatus,
//     required String userName,
//   }) async {
//     try {
//       final response = await _dio.get(
//         '$_baseUrl/Reports/v2/specific_entity_income_proce',
//         queryParameters: {
//           'fromDate': fromDate,
//           'toDate': toDate,
//           'StatementStatus': statementStatus,
//           'UserName': userName,
//         },
//       );

//       return SpecificEntityModel.fromJson(response.data);
//     } on DioException catch (e) {
//       throw Exception(
//         e.response?.data ?? 'خطأ في الاتصال بالسيرفر',
//       );
//     }
//   }
// }