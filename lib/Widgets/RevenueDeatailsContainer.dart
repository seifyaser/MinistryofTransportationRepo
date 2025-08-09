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
  final String text;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const Searchfield({
    super.key,
    required this.text,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.right,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
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
  final TextAlign align;
    final Color? valueColor; 

  const DetailsRow({
    Key? key,
    required this.label,
    this.value,
    this.isHeader = false,
    this.align = TextAlign.right, this.valueColor, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: align == TextAlign.left
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            label,
            textAlign: align,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: isHeader ? 14 : 13,
    color: valueColor ?? Colors.grey[800], 
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (value != null)
            Text(
              value!,
              textAlign: align,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 13,
                
    color: valueColor ?? Colors.grey[800],              fontWeight: FontWeight.w500,
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
