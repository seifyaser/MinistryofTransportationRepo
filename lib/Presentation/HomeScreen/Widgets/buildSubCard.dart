import 'package:flutter/material.dart';

class Buildsubcard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const Buildsubcard({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
     
        border: Border.all(color: Colors.grey),
      //  color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Icon(Icons.arrow_back, color: Color(0xFF38628B), size: 20),
              Text(
                text,
                style: const TextStyle(fontSize: 13, color: Color(0xFF38628B)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
