// sport_record_screen.dart
import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;
import 'package:qring/utils/image_assets.dart';
import 'package:qring/views/sport_record/widgets/tab_selector.dart';
import 'widgets/time_display.dart';
import 'widgets/activity_summary.dart';
import 'widgets/recent_activity_card.dart';

class SportRecordScreen extends StatefulWidget {
  const SportRecordScreen({super.key});

  @override
  State<SportRecordScreen> createState() => _SportRecordScreenState();
}

class _SportRecordScreenState extends State<SportRecordScreen> {
  TimePeriod _currentSelectedPeriod = TimePeriod.day; // Default initial value

  // This is the function to pass to onSelectionChanged
  void _onTimePeriodChanged(TimePeriod newPeriod) {
    setState(() {
      // Update the state variable with the new selected period
      _currentSelectedPeriod = newPeriod;
      print('Selected period: $_currentSelectedPeriod');
    });
  }

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now(); // Can be made dynamic
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: constants.cardColor,
      appBar: AppBar(
        backgroundColor: constants.cardColor,
        foregroundColor: constants.cardColor,
        surfaceTintColor: constants.cardColor,
        title: Text('Sport Record', style: TextStyle(color: Colors.black)),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: constants.drawerclor,
              ),

              child: Image.asset(
                height: 10,
                // fit: BoxFit.contain,
                // width: 10,
                ImageAssets.icons['nav']!,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              // Date Display
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, size: 18),
                  const SizedBox(width: 6),
                  Text(
                    '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              ArrowSelectorDemo(onChanged: _onTimePeriodChanged),

              const SizedBox(height: 20),

              // Timer
              const TimeDisplay(),

              const SizedBox(height: 10),

              // Time & Kcal - Now dynamically update based on _currentSelectedPeriod
              ActivitySummary(
                // Example: You would replace these with actual data based on _currentSelectedPeriod
                time: _currentSelectedPeriod == TimePeriod.day ? '0' : '10',
                kcal: _currentSelectedPeriod == TimePeriod.day ? '0' : '50',
                days: _currentSelectedPeriod == TimePeriod.day ? null : (_currentSelectedPeriod == TimePeriod.week ? '7' : '30'),
              ),

              const SizedBox(height: 20),

              // Recent Activities Card
              const RecentActivityCard(),
            ],
          ),
        ),
      ),
    );
  }
}
