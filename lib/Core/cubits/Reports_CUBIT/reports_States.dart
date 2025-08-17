import 'package:project/models/ReportsModel.dart';


abstract class ReportsState {}

class ReportsInitial extends ReportsState {}

class ReportsLoading extends ReportsState {}

class ReportsLoaded extends ReportsState {
  final ReportsResponse reportsResponse;

  ReportsLoaded(this.reportsResponse);
}

class ReportsError extends ReportsState {
  final String message;

  ReportsError(this.message);
}
