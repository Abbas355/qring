import 'package:flutter/material.dart';
import 'package:qring/views/bottom_navbar/bottom_navigation_bar.dart';
import 'package:qring/views/drawer/custom_drawer.dart';
import '../controllers/health_controller.dart';
import '../utils/constants.dart' as constants;
import '../utils/strings.dart' as strings;
import 'widgets/today_summary.dart';
import 'widgets/activity_tracking.dart';
import 'widgets/weekly_summary.dart';
 // make sure this is imported

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  final HealthController _controller = HealthController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 1; // 👈 Add this line for bottom nav index

  @override
  void initState() {
    super.initState();
    _controller.fetchTodaySummary();
    _controller.fetchActivity();
    _controller.fetchWeeklyActivity();
  }

  // 👇 Bottom nav tap handler
  // void _onNavTap(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //     // Add navigation logic if needed
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(onClose: () => Navigator.of(context).pop()),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: _onNavTap,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    SizedBox(width: size.width * 0.2),
                    Text(strings.healthTitle, style: constants.headerStyle),
                    const Spacer(flex: 2),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                TodaySummary(controller: _controller),
                SizedBox(height: size.height * 0.03),
                ActivityTracker(),
                SizedBox(height: size.height * 0.01),
                Text(strings.thisWeekSection, style: constants.subHeaderStyle),
                SizedBox(height: size.height * 0.01),
                WeeklySummary(controller: _controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
