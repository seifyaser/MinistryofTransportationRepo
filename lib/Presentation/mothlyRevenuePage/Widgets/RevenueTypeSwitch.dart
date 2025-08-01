import 'package:flutter/material.dart';

class RevenueTypeSwitch extends StatelessWidget {
  final bool showRevenuePercentage;
  final ValueChanged<bool> onChanged;

  const RevenueTypeSwitch({
    Key? key,
    required this.showRevenuePercentage,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // زر "نسبة الإيرادات"
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => onChanged(false),
              style: ElevatedButton.styleFrom(
                backgroundColor: showRevenuePercentage
                    ? Colors.grey[200]
                    : const Color(0xFF38628B),
                foregroundColor:
                    showRevenuePercentage ? Colors.black87 : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                elevation: showRevenuePercentage ? 0 : 2,
              ),
              icon: const Icon(Icons.table_chart),
              label: const Text(
                "نسبة الإيرادات",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),

          // زر "جدول الإيرادات"
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => onChanged(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: showRevenuePercentage
                    ? const Color(0xFF38628B)
                    : Colors.grey[200],
                foregroundColor:
                    showRevenuePercentage ? Colors.white : Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                elevation: showRevenuePercentage ? 2 : 0,
              ),
              icon: const Icon(Icons.insert_chart),
              label: const Text(
                "جدول الإيرادات",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
