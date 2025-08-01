import 'package:flutter/material.dart';

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const SizedBox(height: 20),
          _buildBars(),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'الايرادات و الحركة الشهرية',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF38628B),
          ),
          textDirection: TextDirection.rtl,
        ),
        Text(
          'الفترة من شهر 7 سنة 2023 الى شهر 6 سنة 2025',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }

  Widget _buildBars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _barItem('خدمات عربات النوم', '10.39', Colors.orange[300]!),
        const SizedBox(width: 20),
        _barItem('خصم عربات النوم', '16.88', Colors.orange[600]!),
      ],
    );
  }

  Widget _barItem(String title, String value, Color color) {
    return Column(
      children: [
        Container(
          width: 40,
          height: double.parse(value) * 7,
          color: color,
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 10)),
        Row(
          children: [
            Container(width: 8, height: 8, color: color),
            const SizedBox(width: 4),
            Text(value, style: const TextStyle(fontSize: 10)),
          ],
        ),
      ],
    );
  }
}
