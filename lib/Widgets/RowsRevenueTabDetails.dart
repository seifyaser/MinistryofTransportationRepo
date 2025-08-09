import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';
import 'package:project/models/forign_entity_income_model.dart';

class RowsrevenueTabdetails extends StatelessWidget {
  final EntityIncome entity;
  const RowsrevenueTabdetails({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,###'); // للفاصلة كل 3 أرقام

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        DetailsRow(
          label: 'اسم الجهة',
          value: entity.currEntityName,
          isHeader: true,
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: DetailsRow(
                label: 'الإيراد باليورو',
                value: numberFormat.format(entity.currEuroIncome ?? 0),
                valueColor: const Color(0xFF38628B),
              ),
            ),
            Flexible(
              child: DetailsRow(
                label: 'الإيراد بالدولار',
                value: numberFormat.format(entity.currUsdIncome ?? 0),
                valueColor: const Color(0xFF38628B),
              ),
            ),
            Flexible(
              child: DetailsRow(
                label: 'الإيراد بالجنيه',
                value: numberFormat.format(entity.currEgpIncome ?? 0),
                valueColor: const Color(0xFF38628B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        DetailsRow(
          label: 'إجمالي الإيراد بالجنيه',
          value: numberFormat.format(entity.currTotalEgpIncome ?? 0),
          valueColor: Colors.red,
        ),
      ],
    );
  }
}
