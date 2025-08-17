class EntityIncome {
  final String currEntityName;
  final double? currEgpIncome;
  final double? currUsdIncome;
  final double? currEuroIncome;
  final double? currTotalEgpIncome;
  final int currEntityId;
  final double? prevEgpIncome;
  final double? prevUsdIncome;
  final double? prevEuroIncome;
  final double? prevTotalEgpIncome;
  final double? diffTotalEgpIncome;

  EntityIncome({
    required this.currEntityName,
    this.currEgpIncome,
     this.currUsdIncome,
   this.currEuroIncome,
    this.currTotalEgpIncome,
     required this.currEntityId,
     this.prevEgpIncome,
     this.prevUsdIncome,
   this.prevEuroIncome,
   this.prevTotalEgpIncome,
     this.diffTotalEgpIncome,
  });

  factory EntityIncome.fromJson(Map<String, dynamic> json) {
    return EntityIncome(
      currEntityName: json['curr_entity_name'],
      currEgpIncome: (json['curr_egp_income'] as num?)?.toDouble(),
      currUsdIncome: (json['curr_usd_income'] as num?)?.toDouble(),
      currEuroIncome: (json['curr_euro_income'] as num?)?.toDouble(),
      currTotalEgpIncome: (json['curr_total_egp_income'] as num?)?.toDouble(),
      currEntityId: json['curr_entity_id'],
      prevEgpIncome: (json['prev_egp_income'] as num?)?.toDouble(),
      prevUsdIncome: (json['prev_usd_income'] as num?)?.toDouble(),
      prevEuroIncome: (json['prev_euro_income'] as num?)?.toDouble(),
      prevTotalEgpIncome: (json['prev_total_egp_income'] as num?)?.toDouble(),
      diffTotalEgpIncome: (json['diff_total_egp_income'] as num?)?.toDouble(),
    );
  }
}
