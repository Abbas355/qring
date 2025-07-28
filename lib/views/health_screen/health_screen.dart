import 'package:flutter/material.dart';
import 'package:qring/utils/image_assets.dart';
import 'package:qring/views/bottom_navbar/bottom_navigation_bar.dart';
import 'package:qring/views/drawer/custom_drawer.dart';
import '../../controllers/health_controller.dart';
import '../../utils/constants.dart' as constants;
import '../../utils/strings.dart' as strings;
import 'widgets/today_summary.dart';
import 'widgets/activity_tracking.dart';
import 'widgets/weekly_summary.dart';
// make sure this is imported

class HealthScreen extends StatefulWidget {
  final VoidCallback? goToActivityTab; // Callback to trigger tab change
  final VoidCallback? goToSleepTab; // Callback to trigger tab change

  const HealthScreen({super.key, this.goToActivityTab,this.goToSleepTab});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  final HealthController _controller = HealthController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // 👈 Add this line for bottom nav index

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
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: CustomDrawer(onClose: () => Navigator.of(context).pop()),
      appBar: AppBar(
        backgroundColor: constants.cardColor,
        foregroundColor: constants.cardColor,
        surfaceTintColor: constants.cardColor,
        title: Text('Health',style: TextStyle(color: Colors.black),),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all( 15.0),
          child: GestureDetector(
            onTap: (){ _scaffoldKey.currentState?.openDrawer();},
            child: Container(
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: constants.drawerclor,),
              
              child: Image.asset(
                height: 10,
                // fit: BoxFit.contain,
                // width: 10,
                ImageAssets.icons['drawer']!,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:size.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                SizedBox(height: size.height * 0.02),
                TodaySummary(controller: _controller),
                SizedBox(height: size.height * 0.03),
                ActivityTracker(goToActivityTab: widget.goToActivityTab,goToSleepTab: widget.goToSleepTab,),
                SizedBox(height: size.height * 0.01),
                Text(strings.thisWeekSection, style: constants.subHeaderStyle),
                SizedBox(height: size.height * 0.01),
                WeeklySummary(controller: _controller),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
