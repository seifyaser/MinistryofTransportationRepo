import 'package:flutter/material.dart';

class Showemptywidget extends StatelessWidget {
  const Showemptywidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
                      children: [
                        SizedBox(height: 150),
                        Icon(Icons.bar_chart, size: 50, color: Colors.grey[300]),
                        SizedBox(height: 10),
                        Text(
                          "أضف فترة زمنية في محرك البحث",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    );
  }
}