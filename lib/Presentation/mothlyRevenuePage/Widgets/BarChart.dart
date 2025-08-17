import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project/models/forign_entity_income_model.dart';

class RevenueBarChartCard extends StatelessWidget {
  final List<EntityIncome> entities;

  const RevenueBarChartCard({super.key, required this.entities});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: BarChart(
              BarChartData(
                maxY: _getMaxY(),
                barGroups: _buildBarGroups(),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  drawHorizontalLine: true,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: Color(0xFFD3D3D3),
                      strokeWidth: 2,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return const FlLine(
                      color: Color(0xffececec),
                      strokeWidth: 1,
                    );
                  },
                ),
                borderData: FlBorderData(show: false),
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() < entities.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              entities[value.toInt()].currEntityName,
                              style: const TextStyle(fontSize: 10),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: (_getMaxY() / 5).roundToDouble(),
                      getTitlesWidget: (value, meta) {
                        if (value >= 0) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  double _getMaxY() {
    if (entities.isEmpty) return 0;
    final maxIncome = entities
        .map((e) => e.currTotalEgpIncome ?? 0)
        .reduce((a, b) => a > b ? a : b);
    return maxIncome * 1.2; // علشان يبقى فيه مساحة فوق العمود
  }

  List<BarChartGroupData> _buildBarGroups() {
    return List.generate(entities.length, (index) {
      final entity = entities[index];
      final value = entity.currTotalEgpIncome ?? 0;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value,
            width: 20,
            borderRadius: BorderRadius.circular(0),
            color: Colors.orange[600],
          ),
        ],
      );
    });
  }
}
