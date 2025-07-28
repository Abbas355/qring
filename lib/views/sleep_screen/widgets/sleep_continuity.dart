import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SleepChartWidget extends StatelessWidget {
  final List<double> sleepData = [8.0, 7.5, 6.5, 5.0, 9.0, 4.5, 7.0]; // Example data in hours
  final double targetSleep = 6.0; // Target sleep duration in hours

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sleep Continuity',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '5 days out of 7 days achieved the goal',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 18.0,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                show: true,
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        ['12', '13', '14', '15', '16', '17', '18'][value.toInt()],
                        style: const TextStyle(color: Colors.black54, fontSize: 12),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                     reservedSize: 32,
                    getTitlesWidget: (value, meta) {
                      if (value == 0) return Text('00:00', style: const TextStyle(color: Colors.black54, fontSize: 10));
                      if (value == 6) return Text('06:00', style: const TextStyle(color: Colors.black54, fontSize: 10));
                      if (value == 12) return Text('12:00', style: const TextStyle(color: Colors.black54, fontSize: 10));
                      if (value == 18) return Text('18:00', style: const TextStyle(color: Colors.black54, fontSize: 10));
                      return const Text('');
                    },
                    interval: 6,
                  ),
                  
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  left: BorderSide(color: Colors.black.withAlpha(30), width: 4),
                  bottom: BorderSide(color: Colors.black.withAlpha(30), width: 2),
                ),
              ),
              gridData: FlGridData(show: true, drawVerticalLine: false),
              barGroups: sleepData.asMap().entries.map((entry) {
                final int index = entry.key;
                final double value = entry.value;
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: value,
                      color: value < targetSleep ? Colors.red : Colors.green,
                      width: 15,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}