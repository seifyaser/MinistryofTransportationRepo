import 'package:flutter/material.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/PieChart.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';

class RevenuePieDetailsTab extends StatelessWidget {
  const RevenuePieDetailsTab({super.key, required this.ContainerRevenueDetailsText, required this.SearchFieldHintText});
  final String ContainerRevenueDetailsText;
  final String SearchFieldHintText ;

  @override
Widget build(BuildContext context) {
  return Column(
    children: [
      RevenuePieChart(),
      const SizedBox(height: 10),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(15),
        decoration: boxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TitleConatinerRevenue(title: ContainerRevenueDetailsText),
            const SizedBox(height: 20),
            Searchfield(text: SearchFieldHintText),
            const SizedBox(height: 15),
            SizedBox(
  height: 400,
  child: ListView.separated(
    itemCount: 3,
    separatorBuilder: (_, __) => const SizedBox(height: 10),
    itemBuilder: (context, index) => Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: _buildRowsRevenueTab(),
    ),
  ),
),

          ],
        ),
      ),
    ],
  );
}


Widget _buildRowsRevenueTab() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const DetailsRow(
        label: 'اسم الجهة',
        isHeader: true,
      ),
      const DetailsRow(
        label: 'الهيئة القومية لسكك الحديد',
      ),
      const SizedBox(height: 15),
      const DetailsRow(
        label: 'قيمة الايراد',
        isHeader: true,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                DetailsRow(
                  label: 'الفترة المقابلة عام سابق',
                  value: '460,254,853',
                ),
                DetailsRow(
                  label: 'الفرق',
                  value: '202,357,547',
                  valueColor: Colors.red,
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 80,
            color: Colors.grey.shade400,
            margin: const EdgeInsets.symmetric(horizontal: 12),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                DetailsRow(
                  label: 'الفترة المحددة',
                  value: '662,612,400',
                ),
                DetailsRow(
                  label: 'نسبة التغير',
                  value: '33%',
                  valueColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

}




