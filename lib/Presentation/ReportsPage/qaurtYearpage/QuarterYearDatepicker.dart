import 'package:flutter/material.dart';

class QuarterlyPickerButton extends StatefulWidget {
  const QuarterlyPickerButton({Key? key}) : super(key: key);

  @override
  _QuarterlyPickerButtonState createState() => _QuarterlyPickerButtonState();
}

class _QuarterlyPickerButtonState extends State<QuarterlyPickerButton> {
  String? _selectedQuarter;

  void _showQuarterlyPicker() {
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
                  title: 'الربع الأول',
                  subtitle: 'يناير - مارس',
                ),
                const Divider(),
                _buildQuarterOption(
                  title: 'الربع الثاني',
                  subtitle: 'أبريل - يونيو',
                ),
                const Divider(),
                _buildQuarterOption(
                  title: 'الربع الثالث',
                  subtitle: 'يوليو - سبتمبر',
                ),
                const Divider(),
                _buildQuarterOption(
                  title: 'الربع الرابع',
                  subtitle: 'أكتوبر - ديسمبر',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuarterOption({
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      title: Text(title, textAlign: TextAlign.right),
      subtitle: Text(subtitle, textAlign: TextAlign.right),
      onTap: () {
        setState(() {
          _selectedQuarter = title;
        });
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showQuarterlyPicker,
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
              _selectedQuarter ?? 'اختار الربع السنوي',
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}