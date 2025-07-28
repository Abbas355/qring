import 'package:flutter/material.dart';
import 'package:qring/views/activity_screen/activity_screen.dart';
import 'package:qring/views/health_screen/health_screen.dart';
import 'package:qring/views/profile_screen/profile.dart';
import 'package:qring/views/sleep_screen/sleep.dart';
import 'package:qring/views/bottom_navbar/bottom_navigation_bar.dart';

class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  int _currentIndex = 0;

  void onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HealthScreen(
        goToActivityTab: () => onTabChanged(1),
        goToSleepTab: () => onTabChanged(2),
      ),
      const ActivityScreen(),
      const Sleep(),
      const UserScreen(),
    ];

    return Scaffold(
      extendBody: true,
      // backgroundColor: Colors.transparent,
      body: screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabChanged,
      ),
    );
  }
}
