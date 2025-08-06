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
          // button 1
           Flexible(
            fit: FlexFit.tight,
            child: ElevatedButton.icon(
              onPressed: () => onChanged(false),
              style: ElevatedButton.styleFrom(
                backgroundColor: showRevenuePercentage
                    ? Colors.grey[200]
                    : const Color(0xFF38628B),
                foregroundColor:
                    showRevenuePercentage ? Colors.black87 : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: showRevenuePercentage ? 0 : 2,
              ),
              icon: const Icon(Icons.pie_chart),
              label: const Text("مقارنة المدة", style: TextStyle(fontSize: 14)),
            ),
          ),

          const SizedBox(width: 12),

// button 2
          Flexible(
            fit: FlexFit.tight,
            child: ElevatedButton.icon(
              onPressed: () => onChanged(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: showRevenuePercentage
                    ? const Color(0xFF38628B)
                    : Colors.grey[200],
                foregroundColor:
                    showRevenuePercentage ? Colors.white : Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: showRevenuePercentage ? 2 : 0,
              ),
              icon: const Icon(Icons.insert_chart),
              label: const Text("تفاصيل الايرادات", style: TextStyle(fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }
}
