import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StepsGraphWidget extends StatefulWidget {
  final Color barcolor;
  final String unit;

  const StepsGraphWidget({
    super.key,
    required this.barcolor,
    required this.unit,
  });

  @override
  State<StepsGraphWidget> createState() => _StepsGraphWidgetState();
}

class _StepsGraphWidgetState extends State<StepsGraphWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  final List<FlSpot> fullSpots = const [
    FlSpot(0.5, 0.1),
    FlSpot(1, 0.5),
    FlSpot(1.5, 0.6),
    FlSpot(2, 0.8),
    FlSpot(2.5, 0.4),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<FlSpot> getInterpolatedSpots(double progress) {
    int count = (progress * fullSpots.length)
        .clamp(0, fullSpots.length)
        .floor();
    if (count == 0) return [];
    return fullSpots.sublist(0, count);
  }

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
            color: Colors.grey.withAlpha(100),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.2,
              width: size.width * 0.8,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  final animatedSpots = getInterpolatedSpots(_animation.value);

                  return LineChart(
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
                                  style: const TextStyle(fontSize: 10),
                                );
                              }
                              return const Text('');
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 0.3,
                            reservedSize: 30,
                            getTitlesWidget: (value, _) => Text(
                              '${value.toStringAsFixed(1)} ${widget.unit}',
                              style: const TextStyle(fontSize: 10),
                            ),
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
                        border: const Border(
                          bottom: BorderSide(color: Colors.grey, width: 1),
                          left: BorderSide(color: Colors.grey, width: 1),
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
                          color: widget.barcolor,
                          barWidth: 3,
                          isCurved: false,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                          spots: animatedSpots,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
