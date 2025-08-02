import 'package:flutter/material.dart';

/// === Title Container Widget ===
class TitleConatinerRevenue extends StatelessWidget {
  const TitleConatinerRevenue({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF38628B),
      ),
      textDirection: TextDirection.rtl,
    );
  }
}

/// === Search Field Widget ===
class Searchfield extends StatelessWidget {
  const Searchfield({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 11,
        ),
        hintText: text,
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
}

/// === Details Row Widget ===
class DetailsRow extends StatelessWidget {
  final String label;
  final String? value;
  final bool isHeader;

  const DetailsRow({
    Key? key,
    required this.label,
    this.value,
    this.isHeader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value ?? '',
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

// === cONTAINER STYLE ===
  BoxDecoration boxDecoration() {
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
