// time_display.dart
import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {
  const TimeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '00:00:00',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.purple.shade300,
        ),
      ),
    );
  }
}
