import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;

  const CustomHeader({
    Key? key,
    required this.title,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 15,
        bottom: 15,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF38628B),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: onBack ?? () => Navigator.pop(context),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
