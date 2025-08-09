import 'package:flutter/material.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';

class TotalRevenueTabDetailsContainer extends StatelessWidget {
  const TotalRevenueTabDetailsContainer({super.key});

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
            const SizedBox(height: 8),
      
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
              ],
            ),
      

      
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  DetailsRow(
                    label: 'إجمالي الإيراد بالجنيه',
                    value: '607,327,608',
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
