


import 'package:flutter/material.dart';
import 'package:project/models/forign_entity_income_model.dart';

@immutable
abstract class BiSpecificEntityState {}

class BiSpecificEntityInitial extends BiSpecificEntityState {}

class BiSpecificEntityLoading extends BiSpecificEntityState {}

class BiSpecificEntityLoaded extends BiSpecificEntityState {
  final List<EntityIncome> data;
  BiSpecificEntityLoaded(this.data);
}

class BiSpecificEntityError extends BiSpecificEntityState {
  final String message;
  BiSpecificEntityError(this.message);
}
