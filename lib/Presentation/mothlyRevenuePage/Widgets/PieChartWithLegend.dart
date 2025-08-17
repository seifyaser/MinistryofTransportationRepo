import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/legendItem.dart';

class PieChartWithLegend extends StatelessWidget {
  final List entities;
  final double totalRevenue;
  final ScrollController legendScrollController;

  const PieChartWithLegend({
    super.key,
    required this.entities,
    required this.totalRevenue,
    required this.legendScrollController,
  });

  @override
  Widget build(BuildContext context) {
    final pieChartSections = List.generate(entities.length, (index) {
      final entity = entities[index];
      return PieChartSectionData(
        radius: 65,
        color: Colors.primaries[index % Colors.primaries.length],
        value: entity.currTotalEgpIncome ?? 0,
        title: '',
        titleStyle: const TextStyle(),
      );
    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pie Chart
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 150,
            child: PieChart(
              PieChartData(
                sections: pieChartSections,
                sectionsSpace: 3,
                centerSpaceRadius: 0,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        // Legend
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 150,
            child: Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.left,
              controller: legendScrollController,
              thumbVisibility: true,
              child: ListView.builder(
                controller: legendScrollController,
                itemCount: entities.length,
                itemBuilder: (context, index) {
                  final entity = entities[index];
                  final double percentage = totalRevenue > 0
                      ? (entity.currTotalEgpIncome ?? 0) / totalRevenue
                      : 0.0;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: legendItem(
                      entity.currEntityName,
                      Colors.primaries[index % Colors.primaries.length],
                      percentage,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
