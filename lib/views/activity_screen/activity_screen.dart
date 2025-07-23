import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;
import 'package:qring/views/activity_screen/widgets/graph.dart';
import 'package:qring/views/activity_screen/widgets/status_circles.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  DateTime selectedDate = DateTime(2025, 7, 18);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("Activity", style: constants.headerStyle),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined),
                        Text('18-07-2025', style: TextStyle(fontSize: 16)),
                      ],
                    ),

                    SizedBox(height: 16),
                    Container(
                      color: constants.drawerclor.withAlpha(100),
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var day in [
                            'Mon',
                            'Tue',
                            'Wed',
                            'Thu',
                            'Fri',
                            'Sat',
                            'Sun',
                          ])
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              child: Text(day, style: TextStyle(fontSize: 16)),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int day = 14; day <= 20; day++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDate = DateTime(2025, 7, day);
                              });
                            },
                            child: Container(
                              height: 30,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedDate.day == day
                                    ? constants.drawerclor
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  day.toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Container(
                      width: size.width,
                      height: size.height*0.2,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: constants.cardColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: constants.borderColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProgressCircleWithLabel(
                            progress: 0.8,
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
                                    text: '300/1000',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ProgressCircleWithLabel(
                            progress: 0.6,
                            strokeWidth: 7,
                            backgroundColor: constants.feetcolor,
                            progressColor: constants.stepsbar,
                            label: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'Total\nMileage\n'),
                                  TextSpan(
                                    text: '0/5km',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ProgressCircleWithLabel(
                            progress: 0.6,
                            strokeWidth: 7,
                            backgroundColor: constants.caloriesprogressbg,
                            progressColor: constants.caloriesprogresscolor,
                            label: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'Total\nCalories\n'),
                                  TextSpan(
                                    text: '0/200kcal',
                                    style: TextStyle(color: Colors.white),
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
                      "Steps",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: constants.stepsbar,
                      ),
                    ),
                    StepsGraphWidget(barcolor: constants.stepsbar),
                    SizedBox(height: 20),
                    Text(
                      "Steps",
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
