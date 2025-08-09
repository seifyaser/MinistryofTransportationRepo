class SpecificEntityModel {
  final List<ComparePeriodEntity> data;
  final String? error;
  final bool isSuccess;

  SpecificEntityModel({
    required this.data,
    this.error,
    required this.isSuccess,
  });

  factory SpecificEntityModel.fromJson(Map<String, dynamic> json) {
    return SpecificEntityModel(
      data: (json['data'] as List<dynamic>)
          .map((item) => ComparePeriodEntity.fromJson(item))
          .toList(),
      error: json['error'],
      isSuccess: json['isSuccess'] ?? false,
    );
  }
}

class ComparePeriodEntity {
  final String currEntityName;
  final double currTotalEgpIncome;
  final int currEntityId;
  final double? prevTotalEgpIncome;
  final double? diffTotalEgpIncome;
  final double? percentTotalEgpIncome;

  ComparePeriodEntity({
    required this.currEntityName,
    required this.currTotalEgpIncome,
    required this.currEntityId,
    this.prevTotalEgpIncome,
    this.diffTotalEgpIncome,
    this.percentTotalEgpIncome,
  });

  factory ComparePeriodEntity.fromJson(Map<String, dynamic> json) {
    return ComparePeriodEntity(
      currEntityName: json['curr_entity_name'] ?? '',
      currTotalEgpIncome:
          (json['curr_total_egp_income'] ?? 0).toDouble(),
      currEntityId: json['curr_entity_id'] ?? 0,
      prevTotalEgpIncome:
          json['prev_total_egp_income'] != null
              ? (json['prev_total_egp_income'] as num).toDouble()
              : null,
      diffTotalEgpIncome:
          json['diff_total_egp_income'] != null
              ? (json['diff_total_egp_income'] as num).toDouble()
              : null,
      percentTotalEgpIncome:
          json['percent_total_egp_income'] != null
              ? (json['percent_total_egp_income'] as num).toDouble()
              : null,
    );
  }
}
