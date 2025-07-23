import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';

class ActivityModel {
  final int steps;
  final double sleep;
  final int heartRate;
  final double distance;
  final bool hasRing;

  ActivityModel({
    required this.steps,
    required this.sleep,
    required this.heartRate,
    required this.distance,
    this.hasRing = false,
  });

  factory ActivityModel.empty() => ActivityModel(
    steps: 0,
    sleep: 0.0,
    heartRate: 0,
    distance: 0.0,
  );
}

// activity_model.dart
class ActivityData {
  final String title;
  final List<FlSpot> chartData;
  final Color color;

  ActivityData({required this.title, required this.chartData, required this.color});
}