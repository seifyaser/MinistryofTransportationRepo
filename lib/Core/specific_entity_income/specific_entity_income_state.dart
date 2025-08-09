import 'package:project/models/SpeicficEnitiyModel.dart';

abstract class SpecificEntityIncomeState {}

class SpecificEntityIncomeInitial extends SpecificEntityIncomeState {}

class SpecificEntityIncomeLoading extends SpecificEntityIncomeState {}

class SpecificEntityIncomeLoaded extends SpecificEntityIncomeState {
  final SpecificEntityModel comparePeriodModel;
  SpecificEntityIncomeLoaded(this.comparePeriodModel);
}

class SpecificEntityIncomeError extends SpecificEntityIncomeState {
  final String message;
  SpecificEntityIncomeError(this.message);
}