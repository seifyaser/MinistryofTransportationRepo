import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenuePercentaage extends StatelessWidget {
  const RevenuePercentaage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
RevenuePieChart(),

        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(15),
          decoration: _boxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildTitle(),
              const SizedBox(height: 10),
              // RevenuePieChart(),
              const SizedBox(height: 10),
        
              _buildSearchField(),
              const SizedBox(height: 15),
              _buildRows(),
            ],
          ),
        ),
      ],
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
          '',
        ),
        const SizedBox(height: 15),
        _buildTableRow('قيمة الايراد', '', isHeader: true),
        _buildTableRow('الفترة المقابلة عام سابق', '460,254,853'),
        _buildTableRow('الفترة المحددة', '662,612,400'),
        _buildTableRow('الفرق', '202,357,547'),
        const SizedBox(height: 15),
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

  
}



class RevenuePieChart extends StatelessWidget {
  const RevenuePieChart({super.key});

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
                      sections: _buildSections(),
                      sectionsSpace: 3, // المسافة بين الشرائح
                      centerSpaceRadius: 0, // حجم الفراغ في المنتصف
                      ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: _buildLegend(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildSections() {
    final data = [
      {'value': 25.0, 'color': const Color(0xFF4C7AA8), 'title': 'هيئة موانئ البحر الأحمر'}, 
      {'value': 10.0, 'color': const Color(0xFF90D060), 'title': 'خدمات عربات النوم'}, 
      {'value': 5.0, 'color': const Color(0xFFE8CC70), 'title': 'هيئة ميناء دمياط'},
      {'value': 20.0, 'color': const Color(0xFFF0E090), 'title': 'هيئة ميناء الإسكندرية'},
      {'value': 15.0, 'color': const Color(0xFFEF9070), 'title': 'الهيئة لسكك حديد مصر'}, 
      {'value': 10.0, 'color': const Color(0xFFD0D0D0), 'title': 'القطار الكهربائي الخفيف'}, 
      {'value': 8.0, 'color': const Color(0xFF60A0D0), 'title': 'أخرى 1'}, 
      {'value': 4.0, 'color': const Color(0xFFFF6060), 'title': 'أخرى 2'},
      {'value': 3.0, 'color': const Color(0xFF8040C0), 'title': 'أخرى 3'}, 
    ];

    return List.generate(data.length, (i) {

      const widgetStyle = TextStyle();

      return PieChartSectionData(
        radius: 65,
        color: data[i]['color'] as Color,
        value: data[i]['value'] as double,
        title: '', 
        titleStyle: widgetStyle,
        badgeWidget: Text(
          '', // لا تعرض أيقونات Badge
          style: widgetStyle,
        ),
      );
    });
  }

  Widget _buildLegend() {
    final legendItems = [
      {'label': 'هيئة موانئ البحر الأحمر', 'color': const Color(0xFF4C7AA8)},
      {'label': 'خدمات عربات النوم', 'color': const Color(0xFFF0E090)},
      {'label': 'هيئة ميناء دمياط', 'color': const Color(0xFFEF9070)}, 
      {'label': 'هيئة ميناء الإسكندرية', 'color': const Color(0xFFFF6060)},
      {'label': 'الهيئة لسكك حديد مصر', 'color': const Color(0xFFD0D0D0)}, 
      {'label': 'القطار الكهربائي الخفيف', 'color': const Color(0xFF60A0D0)},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: legendItems.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: _legendItem(item['label'] as String, item['color'] as Color),
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
