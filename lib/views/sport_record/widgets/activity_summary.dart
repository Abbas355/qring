import 'package:flutter/material.dart';

class ActivitySummary extends StatelessWidget {
  final String time;
  final String kcal;
  final String? days; // Make nullable

  const ActivitySummary({
    super.key,
    required this.time,
    required this.kcal,
    this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Time column
        Column(
          children: [
            Text(time, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Text('time', style: TextStyle(fontSize: 12)),
          ],
        ),
        const SizedBox(width: 40),

        // Kcal column
        Column(
          children: [
            Text(kcal, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Text('kcal', style: TextStyle(fontSize: 12)),
          ],
        ),

        // Days column (only if days != null)
        if (days != null) ...[
          const SizedBox(width: 40),
          Column(
            children: [
              Text(days!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const Text('days', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ],
    );
  }
}
