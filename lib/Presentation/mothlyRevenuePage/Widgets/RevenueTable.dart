import 'package:flutter/material.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/BarChart.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';


class RevenueBarChart extends StatelessWidget {
  const RevenueBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RevenueBarChartCard(),
        const SizedBox(height: 10),
            Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(15),
          decoration: boxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TitleConatinerRevenue(title: 'جدول الايرادات والحركات الشهرية',),
              const SizedBox(height: 20),
              Searchfield(text: 'بحث في جدول الايرادات والحركات الشهرية',),
              const SizedBox(height: 15),
              _buildRows(),
            ],
          ),
        ),
      ],
    );
  }

Widget _buildRows() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      DetailsRow(
        label: 'اسم الجهة',
        isHeader: true,
      ),
      DetailsRow(
        label: 'الهيئة القومية لسكك الحديد',
      ),
      SizedBox(height: 15),
      DetailsRow(
        label: 'قيمة الايراد',
        isHeader: true,
      ),
      DetailsRow(
        label: 'الفترة المقابلة عام سابق',
        value: '460,254,853',
      ),
      DetailsRow(
        label: 'الفترة المحددة',
        value: '662,612,400',
      ),
      DetailsRow(
        label: 'الفرق',
        value: '202,357,547',
      ),
      SizedBox(height: 15),
    ],
  );
}

}