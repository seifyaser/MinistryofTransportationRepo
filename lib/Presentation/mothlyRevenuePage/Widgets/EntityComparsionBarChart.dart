import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EntityComparisonBarChart extends StatelessWidget {
  final String entityName;
  final double currentIncome;
  final double previousIncome;

  const EntityComparisonBarChart({
    super.key,
    required this.entityName,
    required this.currentIncome,
    required this.previousIncome,
  });

  @override
  Widget build(BuildContext context) {
    final maxY = (currentIncome > previousIncome ? currentIncome : previousIncome) * 1.2;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entityName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: BarChart(
              BarChartData(
                maxY: maxY,
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: previousIncome,
                        color: Colors.grey.shade400,
                        width: 20,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      BarChartRodData(
                        toY: currentIncome,
                        color: Colors.orange.shade700,
                        width: 20,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ],
                    barsSpace: 8,
                  ),
                ],
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        if (value == 0) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                            Text("الفترة  عام سابق",softWrap: true, style: TextStyle(fontSize: 12)),
                              SizedBox(width: 30),
                              Text("الفترة المحددة", style: TextStyle(fontSize: 12)),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                 leftTitles: AxisTitles(
  sideTitles: SideTitles(
    showTitles: true,
    reservedSize: 60,
   // interval: 100, 
    getTitlesWidget: (value, meta) {
      final millionValue = (value / 1000000).toInt(); 
      return Text(
        '${millionValue}M',
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      );
    },
    
    
  ),
),

                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(show: true, horizontalInterval: maxY / 5),
                borderData: FlBorderData(show: false),
                barTouchData: BarTouchData(enabled: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
