import 'package:flutter/material.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';

class TOTALRevenueCompareTabDetailsContainer extends StatelessWidget {
  const TOTALRevenueCompareTabDetailsContainer({super.key});

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
           // const SizedBox(height: 12),
            const DetailsRow(
              label: 'اجمالي ايراد الجهاز',
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
        ),
      ),
    );
  }
}
