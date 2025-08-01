import 'package:flutter/material.dart';
import 'package:project/Widgets/CustomDatefield.dart';

class RevenueDateSearch extends StatelessWidget {
  final TextEditingController fromDateController;
  final TextEditingController toDateController;
  final VoidCallback onSearchPressed;

  const RevenueDateSearch({
    Key? key,
    required this.fromDateController,
    required this.toDateController,
    required this.onSearchPressed,
  }) : super(key: key);

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
        children: [
          const Text(
            'محرك بحث الايرادات',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF38628B),
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 15),
          CustomDateField(
            controller: fromDateController,
            hintText: 'الفترة من',
          ),
          const SizedBox(height: 10),
          CustomDateField(
            controller: toDateController,
            hintText: 'الفترة إلى',
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSearchPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF38628B),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'بحث',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
