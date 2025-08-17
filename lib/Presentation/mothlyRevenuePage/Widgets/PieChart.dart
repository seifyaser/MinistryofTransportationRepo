import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenuePieChart extends StatelessWidget {
  final List<PieChartSectionData> sections;
  final Widget legend;

  const RevenuePieChart({
    super.key,
    required this.sections,
    required this.legend,
  });

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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'نسبة الايرادات لكل جهة',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF38628B),
            ),
            textDirection: TextDirection.rtl,
          ),
          const Text(
            'الفترة من شهر 7 سنة 2023 الى شهر 6 سنة 2025',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: PieChart(
                    PieChartData(
                      sections: sections,
                      sectionsSpace: 3,
                      centerSpaceRadius: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: legend,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PieChartLegend extends StatelessWidget {
  final List<PieChartSectionData> sections;

  const PieChartLegend({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: sections.map((section) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: _legendItem(
            section.title ?? 'غير محدد',
            section.color,
          ),
        );
      }).toList(),
    );
  }

  Widget _legendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}