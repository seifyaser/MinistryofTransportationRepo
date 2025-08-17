import 'package:flutter/material.dart';

class CustomQuarterlyPickerField extends StatelessWidget {
  final String? selectedQuarter;
  final Function(String quarter, DateTime from, DateTime to) onQuarterSelected;

  const CustomQuarterlyPickerField({
    Key? key,
    this.selectedQuarter,
    required this.onQuarterSelected,
  }) : super(key: key);

  void _showQuarterlyPicker(BuildContext context) {
    final now = DateTime.now();
    final year = now.year;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('اختار الربع السنوي', textAlign: TextAlign.right),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildQuarterOption(
                  context,
                  title: 'الربع الأول',
                  subtitle: 'يناير - مارس',
                  from: DateTime(year, 1, 1),
                  to: DateTime(year, 3, 31),
                ),
                const Divider(),
                _buildQuarterOption(
                  context,
                  title: 'الربع الثاني',
                  subtitle: 'أبريل - يونيو',
                  from: DateTime(year, 4, 1),
                  to: DateTime(year, 6, 30),
                ),
                const Divider(),
                _buildQuarterOption(
                  context,
                  title: 'الربع الثالث',
                  subtitle: 'يوليو - سبتمبر',
                  from: DateTime(year, 7, 1),
                  to: DateTime(year, 9, 30),
                ),
                const Divider(),
                _buildQuarterOption(
                  context,
                  title: 'الربع الرابع',
                  subtitle: 'أكتوبر - ديسمبر',
                  from: DateTime(year, 10, 1),
                  to: DateTime(year, 12, 31),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuarterOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required DateTime from,
    required DateTime to,
  }) {
    return ListTile(
      title: Text(title, textAlign: TextAlign.right),
      subtitle: Text(subtitle, textAlign: TextAlign.right),
      onTap: () {
        onQuarterSelected(title, from, to);
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showQuarterlyPicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedQuarter ?? 'اختار الربع السنوي',
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
