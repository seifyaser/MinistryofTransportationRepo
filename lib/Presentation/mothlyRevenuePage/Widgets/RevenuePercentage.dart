import 'package:flutter/material.dart';

class RevenuePercentaage extends StatelessWidget {
  const RevenuePercentaage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildTitle(),
          const SizedBox(height: 10),
          _buildSearchField(),
          const SizedBox(height: 15),
          _buildRows(),
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
    return Text(
      'جدول الايرادات و الحركات الشهرية',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF38628B),
      ),
      textDirection: TextDirection.rtl,
    );
  }

  Widget _buildSearchField() {
    return TextField(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        hintText: 'بحث في جدول الايرادات و الحركات الشهرية',
        hintTextDirection: TextDirection.rtl,
        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
      ),
    );
  }

  Widget _buildRows() {
    return Column(
      children: [
        _buildTableRow('اسم الجهة', '', isHeader: true),
        _buildTableRow(
          'الهيئة القومية لسكك الحديد',
          '.............................................',
        ),
        const SizedBox(height: 15),
        _buildTableRow('قيمة الايراد', '', isHeader: true),
        _buildTableRow('الفترة المقابلة عام سابق', '460,254,853'),
        _buildTableRow('الفترة المحددة', '662,612,400'),
        _buildTableRow('الفرق', '202,357,547'),
        const SizedBox(height: 15),
        _buildDetailsLink(),
        const SizedBox(height: 15),
        _buildTableRow('اسم الحزمة', '', isHeader: true),
      ],
    );
  }

  Widget _buildTableRow(String label, String value, {bool isHeader = false}) {
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
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: isHeader ? 14 : 13,
                color: isHeader ? Colors.black : Colors.grey[700],
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsLink() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          print('تفاصيل الجهة tapped');
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'تفاصيل الجهة',
              style: TextStyle(
                color: Color(0xFF38628B),
                fontSize: 14,
                decoration: TextDecoration.underline,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(width: 5),
            Icon(Icons.arrow_back, color: Color(0xFF38628B), size: 18),
          ],
        ),
      ),
    );
  }
}
