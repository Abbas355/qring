import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 23),
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
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: constants.cardColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: constants.borderColor),
                      ),
                      child: SleepScoreWidget(),
                    )
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
