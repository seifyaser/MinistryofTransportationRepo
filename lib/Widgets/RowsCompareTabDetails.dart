import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';
import 'package:project/models/SpeicficEnitiyModel.dart';

class RowscompareTabdetails extends StatelessWidget {
  final ComparePeriodEntity entity;

  const RowscompareTabdetails({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,###'); // للفاصلة كل 3 أرقام

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const DetailsRow(label: 'اسم الجهة', isHeader: true),
        const SizedBox(height: 4),
        DetailsRow(label: entity.currEntityName),
        const SizedBox(height: 12),
        const DetailsRow(label: 'قيمة الايراد', isHeader: true),
        const SizedBox(height: 6),

        Row(
          children: [
            Expanded(
              child: DetailsRow(
                label: 'الفترة المحددة',
                value: numberFormat.format(entity.currTotalEgpIncome),
                valueColor: Colors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DetailsRow(
                label: 'الفترة المقابلة عام سابق',
                value: numberFormat.format(entity.prevTotalEgpIncome ?? 0),
                valueColor: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),

        Row(
          children: [
            Expanded(
              child: DetailsRow(
                label: 'نسبة التغير',
                value: '${(entity.percentTotalEgpIncome ?? 0).toStringAsFixed(2)}%',
                valueColor: Colors.red,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DetailsRow(
                label: 'الفرق',
                value: numberFormat.format(entity.diffTotalEgpIncome ?? 0),
                valueColor: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

