import 'package:flutter/material.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';

class RowscompareTabdetails extends StatelessWidget {
  const RowscompareTabdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const DetailsRow(
          label: 'اسم الجهة',
          isHeader: true,
        ),
        const SizedBox(height: 4),
        const DetailsRow(
          label: 'الهيئة القومية لسكك الحديد',
        ),
        const SizedBox(height: 12),
        const DetailsRow(
          label: 'قيمة الايراد',
          isHeader: true,
        ),
        const SizedBox(height: 6),

        // الصف الأول
        Row(
          children: const [
            Expanded(
              child: DetailsRow(
                label: 'الفترة المحددة',
                value: '662,612,400',
                valueColor: Colors.green,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: DetailsRow(
                label: 'الفترة المقابلة عام سابق',
                value: '460,254,853',
                valueColor: Colors.green,

              ),
            ),
          ],
        ),
        const SizedBox(height: 6),

        // الصف الثاني
        Row(
          children: const [
            Expanded(
              child: DetailsRow(
                label: 'نسبة التغير',
                value: '33%',
                valueColor: Colors.red,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: DetailsRow(
                label: 'الفرق',
                value: '202,357,547',
                valueColor: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
