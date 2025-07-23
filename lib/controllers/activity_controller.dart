// activity_controller.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:qring/models/activity_model.dart';


class ActivityController {
  List<ActivityData> getActivityData() {
    return [
      ActivityData(
        title: 'Steps',
        chartData: [
          FlSpot(0, 0),
          FlSpot(2, 4),
          FlSpot(4, 6),
          FlSpot(6, 2),
        ],
        color: Colors.orange,
      ),
      ActivityData(
        title: 'Mileage',
        chartData: [
          FlSpot(0, 2),
          FlSpot(2, 1.5),
          FlSpot(4, 1),
          FlSpot(6, 1.8),
        ],
        color: Colors.green,
      ),
      ActivityData(
        title: 'Calories',
        chartData: [
          FlSpot(0, 0),
          FlSpot(2, 1),
          FlSpot(4, 2),
          FlSpot(6, 1.5),
        ],
        color: Colors.purple,
      ),
    ];
  }
}