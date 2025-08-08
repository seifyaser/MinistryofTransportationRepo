import 'package:flutter/material.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';

class RowsrevenueTabdetails extends StatelessWidget {
  const RowsrevenueTabdetails({super.key});

  @override
  Widget build(BuildContext context) {
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