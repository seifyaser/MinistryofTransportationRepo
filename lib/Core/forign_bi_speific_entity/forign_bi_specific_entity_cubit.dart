import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Core/forign_bi_speific_entity/forign_bi_specific_entity_state.dart';
import 'package:project/Services/forign_bi_specific_enitity.dart';

import 'package:shared_preferences/shared_preferences.dart';


class ForignBiSpecificEntityCubit extends Cubit<BiSpecificEntityState> {
  final BiSpecificEntity reportsService;

  ForignBiSpecificEntityCubit(this.reportsService) : super(BiSpecificEntityInitial());

  Future<void> fetchReport({
    required String fromDate,
    required String toDate,
  }) async {
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

      emit(BiSpecificEntityLoaded(data));
    } catch (e) {
      emit(BiSpecificEntityError(e.toString()));
    }
  }
}
