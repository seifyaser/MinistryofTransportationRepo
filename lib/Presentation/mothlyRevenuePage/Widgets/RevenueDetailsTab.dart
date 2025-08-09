import 'package:flutter/material.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/PieChart.dart';
import 'package:project/Widgets/RowsRevenueTabDetails.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';
import 'package:project/Widgets/TOTALRevenue_RevenueTabDetails.dart';

class RevenuePieDetailsTab extends StatelessWidget {
   RevenuePieDetailsTab({super.key, required this.ContainerRevenueDetailsText, required this.SearchFieldHintText, });
  final String ContainerRevenueDetailsText;
  final String SearchFieldHintText ;
  final TextEditingController _searchController = TextEditingController();

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
            Searchfield(text: SearchFieldHintText, controller: _searchController,),
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
      child: RowsrevenueTabdetails(),
    ),
  ),
),
          ],
        ),
      ),
      TotalRevenueTabDetailsContainer()

    ],
    
  );
}



}




