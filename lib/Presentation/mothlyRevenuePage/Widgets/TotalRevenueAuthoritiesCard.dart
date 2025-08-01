import 'package:flutter/material.dart';

class TotalRevenueInAuthoritiesCard extends StatelessWidget {
  const TotalRevenueInAuthoritiesCard({super.key});

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
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            'اجمالي الايراد في الهيئات',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF38628B),
            ),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: 10),
          TableRowItem(label: 'الفترة المقابلة عام سابق', value: '2,541,432,549'),
          TableRowItem(label: 'الفترة المحددة', value: '3,701,498,621'),
          TableRowItem(label: 'الفرق', value: '1,160,026,072'),
        ],
      ),
    );
  }
}

class TableRowItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isHeader;

  const TableRowItem({
    super.key,
    required this.label,
    required this.value,
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: isHeader ? 14 : 13,
              color: isHeader ? Colors.black : Colors.grey[700],
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            ),
            textDirection: TextDirection.rtl,
          ),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: isHeader ? 14 : 13,
                color: isHeader ? Colors.black : Colors.grey[700],
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
