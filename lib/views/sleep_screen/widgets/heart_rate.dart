import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:qring/utils/constants.dart' as constants;

class HeartRateChartWidget extends StatelessWidget {
  String title;

  HeartRateChartWidget({super.key,required this.title});
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '72 bpm',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: constants.drawerclor,
              ),
            ),
          ],
        ),
        Divider(color: Colors.black.withAlpha(50), thickness: 1),

        SizedBox(height: size.height*0.015),
        Container(
          height: 150,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.grey.withOpacity(0.3),
                    strokeWidth: 2,
                  );
                },
                horizontalInterval: 40, // Interval for 0, 80, 120, 160
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    interval: 6,
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 0:
                          return Text(
                            '00:00',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          );
                        case 6:
                          return Text(
                            '06:00',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          );
                        case 12:
                          return Text(
                            '12:00',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          );
                        case 18:
                          return Text(
                            '18:00',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          );
                        case 24:
                          return Text(
                            '23:59',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          );
                        default:
                          return const Text('');
                      }
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 40,
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 0:
                          return Text(
                            '0',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          );
                        case 40:
                          return Text(
                            '40',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          );
                        case 80:
                          return Text(
                            '80',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          );
                        case 120:
                          return Text(
                            '120',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          );
                        case 160:
                          return Text(
                            '160',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          );
                        default:
                          return const Text('');
                      }
                    },
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  left: BorderSide(color: Colors.black.withAlpha(30), width: 4),
                  bottom: BorderSide(color: Colors.black.withAlpha(30), width: 4),
                ),
              ),
              minX: 0,
              maxX: 24,
              minY: 0,
              maxY: 160,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 80), // 00:00
                    FlSpot(2, 90), // 06:00
                    FlSpot(3, 70), // 12:00
                    FlSpot(4, 120), // 18:00
                    FlSpot(5, 60), // 23:59
                    FlSpot(6, 80), // 23:59
                    FlSpot(7, 80), // 23:59
                    FlSpot(8, 100), // 23:59
                    FlSpot(9, 50), // 23:59
                    FlSpot(10, 75), // 23:59
                    FlSpot(11, 85), // 23:59
                    FlSpot(12, 80), // 23:59
                  ],
                  isCurved: false,
                  color: constants.heartratecolor,
                  barWidth: 2,
                  dotData: FlDotData(show: false),
                ),
              ],
              lineTouchData: LineTouchData(enabled: false),
            ),
          ),
        ),
      ],
    );
  }
}
