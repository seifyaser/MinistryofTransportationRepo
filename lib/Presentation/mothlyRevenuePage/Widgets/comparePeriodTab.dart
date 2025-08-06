import 'package:flutter/material.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/BarChart.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';


class ComparePeriodTab extends StatelessWidget {
  const ComparePeriodTab({super.key, required this.ContainerRevenueDetailsText, required this.SearchFieldHintText});
  final String ContainerRevenueDetailsText;
  final String SearchFieldHintText ;


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
              TitleConatinerRevenue(title: ContainerRevenueDetailsText,),
              const SizedBox(height: 20),
              Searchfield(text: SearchFieldHintText,),
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
      child: _buildRowsCompareTab(),
    ),
  ),
),
            ],
          ),
        ),
      ],
    );
  }

Widget _buildRowsCompareTab() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const DetailsRow(
              label: 'اسم الجهة',
              isHeader: true,
            ),
         
      const DetailsRow(
        label: 'الهيئة القومية لسكك الحديد',
      ),
      const SizedBox(height: 15),

      Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Flexible(
          child: DetailsRow(
            label: 'الإيراد باليورو',
            value: '7,165',
            valueColor: Color(0xFF38628B),
          ),
        ),
        Flexible(
          child: DetailsRow(
            label: 'الإيراد بالدولار',
            value: '163,456',
            valueColor: Color(0xFF38628B),
          ),
        ),
       
        Flexible(
          child: DetailsRow(
            label: 'الإيراد بالجنيه',
            value: '607,156,987',
            valueColor: Color(0xFF38628B),
          ),
        ),
        const SizedBox(height: 15),
      
      
      
      ],
      ),
      Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const DetailsRow(
            label: 'إجمالي الإيراد بالجنيه',
            value: '607,327,608',
            valueColor: Colors.red,
          ),
        ],
        ),
      ),
    ],
  );


}

}