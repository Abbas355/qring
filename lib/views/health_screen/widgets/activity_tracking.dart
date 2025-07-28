import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qring/views/activity_screen/activity_screen.dart';
import 'package:qring/views/heart_rate/heart_rate_screen.dart';
import 'package:qring/views/sleep_screen/sleep.dart';
import 'package:qring/views/sport_record/sport_record.dart';

import '../../../utils/constants.dart' as constants;
import '../../../utils/strings.dart' as strings;
import 'activity_card.dart';

class ActivityTracker extends StatelessWidget {
   final VoidCallback? goToActivityTab;
   final VoidCallback? goToSleepTab;
  const ActivityTracker({super.key,this.goToActivityTab,this.goToSleepTab});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          strings.activityTracking,
          style: constants.subHeaderStyle,
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: goToActivityTab,
          child: const ActivityCard(
            iconcolor: constants.caloriescolor,
            label: 'Activity',
            color: Colors.orangeAccent,
            iconKey: 'activity',
          ),
        ),
        GestureDetector(
          onTap:goToSleepTab,
          child: const ActivityCard(
            iconcolor: constants.feetcolor,
            label: 'Sleep',
            color: Colors.lightGreen,
            iconKey: 'sleep',
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>HeartRateScreen())),
          child: const ActivityCard(
            iconcolor: constants.watercolor,
            label: 'Heart Rate',
            color: Colors.lightBlueAccent,
            iconKey: 'heart',
          ),
        ),
        GestureDetector(
          onTap:()=> Navigator.push(context,MaterialPageRoute(builder: (context)=>SportRecordScreen())),
          child: const ActivityCard(
            iconcolor: constants.sportcardcolor,
            label: 'Sport Record',
            color: Colors.pinkAccent,
            iconKey: 'sport',
          ),
        ),
      ],
    );
  }
}
