import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Core/cubits/forign_bi_speific_entity/forign_bi_specific_entity_state.dart';
import 'package:project/Services/forign_bi_specific_enitity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForignBiSpecificEntityCubit extends Cubit<BiSpecificEntityState> {
  final BiSpecificEntity reportsService;

  ForignBiSpecificEntityCubit(this.reportsService) : super(BiSpecificEntityInitial());

  Future<void> fetchRevenues({
    required String fromDate,
    required String toDate,
  }) async {
    // تحقق من أن Cubit لم يتم إغلاقه قبل إصدار أي حالة
    if (isClosed) return;

    emit(BiSpecificEntityLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      final userId = prefs.getString('userId') ?? '';

      final data = await reportsService.getSpecificEntityIncome(
        fromDate: fromDate,
        toDate: toDate,
        statementStatus: 1,
        userName: userId,
        token: token,
      );

      // تحقق مرة أخرى قبل إصدار حالة النجاح
      if (!isClosed) {
        emit(BiSpecificEntityLoaded(data));
      }
    } catch (e) {
      // تحقق مرة أخرى قبل إصدار حالة الخطأ
      if (!isClosed) {
        emit(BiSpecificEntityError(e.toString()));
      }
    }
  }
}