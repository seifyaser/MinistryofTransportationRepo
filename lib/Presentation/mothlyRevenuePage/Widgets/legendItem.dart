import 'package:flutter/material.dart';

Widget legendItem(String? label, Color color, double? percentage) {
    final formattedPercentage = (percentage != null && !percentage.isNaN)
        ? (percentage * 100).toStringAsFixed(1)
        : "0";

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                label ?? 'غير محدد',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (percentage != null)
                Text(
                  '$formattedPercentage %',
                  style: const TextStyle(fontSize: 22, color: Colors.grey),
                  textAlign: TextAlign.right,
                ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }