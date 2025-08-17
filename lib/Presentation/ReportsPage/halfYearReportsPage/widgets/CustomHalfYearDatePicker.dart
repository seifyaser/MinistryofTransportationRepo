import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomHalfYearPickerField extends StatelessWidget {
  final String? selectedHalfYear;
  final Function(String half, DateTime from, DateTime to) onHalfSelected;

  const CustomHalfYearPickerField({
    Key? key,
    this.selectedHalfYear,
    required this.onHalfSelected,
  }) : super(key: key);

  void _showHalfYearPicker(BuildContext context) {
    final now = DateTime.now();
    final year = 2024;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('اختار النصف السنوي', textAlign: TextAlign.right),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // النصف الأول
              ListTile(
                title: const Text('النصف الأول', textAlign: TextAlign.right),
                subtitle:
                    const Text('يناير - يونيو', textAlign: TextAlign.right),
                onTap: () {
                  onHalfSelected(
                    'النصف الأول',
                    DateTime(year, 1, 1),
                    DateTime(year, 6, 1),
                  );
                  Navigator.of(context).pop();
                },
              ),

              const Divider(),

              // النصف الثاني
              ListTile(
                title: const Text('النصف الثاني', textAlign: TextAlign.right),
                subtitle:
                    const Text('يوليو - ديسمبر', textAlign: TextAlign.right),
                onTap: () {
                  onHalfSelected(
                    'النصف الثاني',
                    DateTime(year, 7, 1),
                    DateTime(year, 12, 31),
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showHalfYearPicker(context),
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
              selectedHalfYear ?? 'اختار النصف السنوي',
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
