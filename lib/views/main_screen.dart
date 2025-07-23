import 'package:flutter/material.dart';
import 'package:qring/views/activity_screen/activity_screen.dart';
import 'package:qring/views/health_screen.dart';
import 'package:qring/views/profile.dart';
import 'package:qring/views/sleep_screen/sleep.dart';
import 'package:qring/views/bottom_navbar/bottom_navigation_bar.dart';

class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HealthScreen(),
    const ActivityScreen(),
    const Sleep(),
    const Profile(),
  ];

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabChanged,
      ),
    );
  }
}
