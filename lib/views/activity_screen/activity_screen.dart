import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;
import 'package:qring/views/activity_screen/widgets/calender.dart';
import 'package:qring/views/activity_screen/widgets/graph.dart';
import 'package:qring/views/activity_screen/widgets/status_circles.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  DateTime selectedDate = DateTime.now();
  int currentCalories = 120;
  int totalCalories = 200;
  int currentSteps = 300;
  int totalSteps = 1000;
  double currentMileage = 2.0;
  double totalMileage = 5.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: constants.cardColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.02,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("Activity", style: constants.headerStyle),
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
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProgressCircleWithLabel(
                            progress: currentSteps / totalSteps,
                            strokeWidth: 7,
                            backgroundColor: constants.caloriescolor,
                            progressColor: constants.caloriebar,
                            label: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Total\nSteps\n',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: '$currentSteps/$totalSteps',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ProgressCircleWithLabel(
                            progress: currentMileage / totalMileage,
                            strokeWidth: 7,
                            backgroundColor: constants.feetcolor,
                            progressColor: constants.stepsbar,
                            label: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'Total\nMileage\n'),
                                  TextSpan(
                                    text: '${currentMileage.toStringAsFixed(1)}/${totalMileage.toStringAsFixed(1)} km',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ProgressCircleWithLabel(
                            progress: currentCalories / totalCalories,
                            strokeWidth: 7,
                            backgroundColor: constants.caloriesprogressbg,
                            progressColor: constants.caloriesprogresscolor,
                            label: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'Total\nCalories\n'),
                                  TextSpan(
                                    text:
                                        '$currentCalories/$totalCalories kcal',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Steps",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: constants.caloriebar,
                      ),
                    ),
                    StepsGraphWidget(barcolor: constants.caloriebar),
                    SizedBox(height: 20),
                    Text(
                      "Milage",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: constants.stepsbar,
                      ),
                    ),
                    StepsGraphWidget(barcolor: constants.stepsbar),
                    SizedBox(height: 20),
                    Text(
                      "Calories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: constants.caloriesprogresscolor,
                      ),
                    ),
                    StepsGraphWidget(barcolor: constants.caloriesprogresscolor),
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
