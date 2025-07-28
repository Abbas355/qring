import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;
import 'package:qring/views/activity_screen/widgets/calender.dart';
import 'package:qring/views/sleep_screen/widgets/donut_progress.dart';
import 'package:qring/views/sleep_screen/widgets/heart_rate.dart';
import 'package:qring/views/sleep_screen/widgets/sleep_continuity.dart';
import 'package:qring/views/sleep_screen/widgets/sleep_score.dart';

class Sleep extends StatefulWidget {
  const Sleep({super.key});

  @override
  State<Sleep> createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  DateTime selectedDate = DateTime(2025, 7, 18);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: constants.cardColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.02,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("Sleep", style: constants.headerStyle),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Calender(),
                    SizedBox(height: 20),
                    Container(
                      width: size.width,
                      height: size.height * 0.2,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: constants.cardColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(100),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: SleepScoreWidget(),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: size.width,
                      height: size.height * 0.25,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: constants.cardColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(100),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: SleepStageChartWidget(
                        wakeuptime: 121,
                        lightsleep: 321,
                        deepsleep: 218,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: size.width,
                      height: size.height * 0.25,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: constants.cardColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(100),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: HeartRateChartWidget(title: "Average Heart Rate"),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: size.width,
                      height: size.height * 0.25,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: constants.cardColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(100),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: SleepChartWidget(),
                    ),

                    // SizedBox(height: 50,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
