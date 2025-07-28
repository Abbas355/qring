import 'package:flutter/material.dart';
import '../../../controllers/health_controller.dart';
import '../../../utils/constants.dart' as constants;
import '../../../utils/strings.dart' as strings;
import 'health_card.dart';

class WeeklySummary extends StatelessWidget {
  final HealthController controller;

  const WeeklySummary({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final data = controller.weeklyActivity;
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: constants.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(100),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const SizedBox(height: 10),
          Row(
            children: [
              HealthCard(
                title: strings.avgDistance,
                value: '${data.avgDistance.toStringAsFixed(1)}km',
                backgroundColor: const Color(0xFFF5E6F2),
              ),
              HealthCard(
                title: strings.avgSleep,
                value: '${data.avgSleep.toStringAsFixed(1)}hr',
                backgroundColor: const Color(0xFFE0F2E9),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              HealthCard(
                title: strings.restingHR,
                value: '${data.restingHR}bpm',
                backgroundColor: const Color(0xFFE6F0FA),
              ),
              HealthCard(
                title: strings.goalRate,
                value: '${data.goalRate}%',
                backgroundColor: const Color(0xFFFDE4E4),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
