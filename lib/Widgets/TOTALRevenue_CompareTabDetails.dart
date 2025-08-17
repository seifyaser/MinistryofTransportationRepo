import 'package:flutter/material.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';
class TOTALRevenueCompareTabDetailsContainer extends StatelessWidget {
  final String periodIncome;
  final String prevPeriodIncome;
  final String changePercent;
  final String difference;

  const TOTALRevenueCompareTabDetailsContainer({
    super.key,
    required this.periodIncome,
    required this.prevPeriodIncome,
    required this.changePercent,
    required this.difference,
  });

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: DetailsRow(
                    label: 'الفترة المحددة',
                    value: periodIncome,
                    valueColor: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DetailsRow(
                    label: 'الفترة المقابلة عام سابق',
                    value: prevPeriodIncome,
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
                    value: changePercent,
                    valueColor: Colors.red,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DetailsRow(
                    label: 'الفرق',
                    value: difference,
                    valueColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
