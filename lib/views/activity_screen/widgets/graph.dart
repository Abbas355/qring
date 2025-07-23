import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StepsGraphWidget extends StatelessWidget {
  Color barcolor;

  StepsGraphWidget({super.key,required this.barcolor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
    
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.grey.withOpacity(0.3),
                      strokeWidth: 1,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          const labels = [
                            '00:00',
                            '06:00',
                            '12:00',
                            '18:00',
                            '23:59',
                          ];
                          if (value.toInt() < labels.length) {
                            return Text(
                              labels[value.toInt()],
                              style: TextStyle(fontSize: 10),
                            );
                          }
                          return Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 0.3,
                        getTitlesWidget: (value, _) {
                          return Text(
                            '${value.toStringAsFixed(1)}',
                            style: TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ), // X-axis
                      left: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ), // Y-axis
                      right: BorderSide.none,
                      top: BorderSide.none,
                    ),
                  ),
                  minX: 0,
                  maxX: 4,
                  minY: 0,
                  maxY: 0.9,
                  lineBarsData: [
                    LineChartBarData(
                      color: barcolor,
                      barWidth: 3,
                      isCurved: false,
                      dotData: FlDotData(show: false), // ❌ No point circles
                      belowBarData: BarAreaData(show: false),
                      spots: const [
                        FlSpot(0.5, 0.1),
                        FlSpot(1, 0.5),
                        FlSpot(2, 0.6),
                        FlSpot(3, 0.8),
                        FlSpot(4, 0.4),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
