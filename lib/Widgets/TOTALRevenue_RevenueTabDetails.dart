import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';

class TotalRevenueTabDetailsContainer extends StatelessWidget {
  final double euroIncome;
  final double usdIncome;
  final double egpIncome;
  final double totalEgpIncome;

  const TotalRevenueTabDetailsContainer({
    super.key,
    required this.euroIncome,
    required this.usdIncome,
    required this.egpIncome,
    required this.totalEgpIncome,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(86, 66, 78, 134),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TitleConatinerRevenue(title: 'اجمالي ايراد الجهاز'),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: DetailsRow(
                    label: 'الإيراد باليورو',
                    value: formatter.format(euroIncome),
                    valueColor: const Color(0xFF38628B),
                  ),
                ),
                Flexible(
                  child: DetailsRow(
                    label: 'الإيراد بالدولار',
                    value: formatter.format(usdIncome),
                    valueColor: const Color(0xFF38628B),
                  ),
                ),
                Flexible(
                  child: DetailsRow(
                    label: 'الإيراد بالجنيه',
                    value: formatter.format(egpIncome),
                    valueColor: const Color(0xFF38628B),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DetailsRow(
                    label: 'إجمالي الإيراد بالجنيه',
                    value: formatter.format(totalEgpIncome),
                    valueColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
