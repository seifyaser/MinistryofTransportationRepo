import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';


/*

نخزن الـ tokenString في SharedPreferences (1)

نفك التوكن باستخدام JwtDecoder (2)

نستخرج البيانات المهمة (userId, role) (3)

 نخزنهم محليًا برضو  (4)

(5)  نعيد Map أو كائن 
يحتوي على القيم دي لو حبيت
 تستخدمهم مباشرة



*/


class AuthService {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://41.33.148.248:5555/api';

  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/Users/login',
        data: {
          'userName': username,
          'passWord': password,
        },
      );

      log(response.data.toString());

      final String token = response.data['tokenString'];

      //  فك التوكن
      final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      // استخراج البيانات من التوكن
      final String role = decodedToken['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'];
      final String userId = decodedToken['http://schemas.microsoft.com/ws/2008/06/identity/claims/userdata'];

      //  تخزين في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('authToken', token);
      await prefs.setString('userRole', role);
      await prefs.setString('userId', userId);

      log('Decoded Token: $decodedToken');
log('Roles: ${decodedToken['http://schemas.microsoft.com/ws/2008/06/identity/claims/role']}');
log('UserData: ${decodedToken['http://schemas.microsoft.com/ws/2008/06/identity/claims/userdata']}');

      return {
        'token': token,
        'role': role,
        'userId': userId,
      };
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? 'خطأ في الاتصال بالسيرفر');
    }
  }
}
