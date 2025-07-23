import 'package:flutter/material.dart';
import '../../utils/constants.dart' as constants;
import '../../utils/strings.dart' as strings;
import 'activity_card.dart';

class ActivityTracker extends StatelessWidget {
  const ActivityTracker({super.key});

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
        const ActivityCard(
          iconcolor: constants.caloriescolor,
          label: 'Activity',
          color: Colors.orangeAccent,
          iconKey: 'activity',
        ),
        const ActivityCard(
          iconcolor: constants.feetcolor,
          label: 'Sleep',
          color: Colors.lightGreen,
          iconKey: 'sleep',
        ),
        const ActivityCard(
          iconcolor: constants.watercolor,
          label: 'Heart Rate',
          color: Colors.lightBlueAccent,
          iconKey: 'heart',
        ),
        const ActivityCard(
          iconcolor: constants.sportcardcolor,
          label: 'Sport Record',
          color: Colors.pinkAccent,
          iconKey: 'sport',
        ),
      ],
    );
  }
}
