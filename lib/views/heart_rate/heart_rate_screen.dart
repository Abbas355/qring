import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;
import 'package:qring/utils/image_assets.dart';
import 'package:qring/views/heart_rate/widgets/custom_container.dart';
import 'package:qring/views/heart_rate/widgets/detection.dart';
import 'package:qring/views/heart_rate/widgets/radial_bar.dart';
import 'package:qring/views/sleep_screen/widgets/heart_rate.dart';

class HeartRateScreen extends StatefulWidget {
  const HeartRateScreen({super.key});

  @override
  State<HeartRateScreen> createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen> {
  DateTime _selectedDate = DateTime(2025, 07, 18); // Default date from image
  bool _isDetectionOn = false; // Default toggle state
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      
      backgroundColor: constants.cardColor,
      appBar: AppBar(
        backgroundColor: constants.cardColor,
        foregroundColor: constants.cardColor,
        surfaceTintColor: constants.cardColor,
        title: Text('Heart Rate',style: TextStyle(color: Colors.black),),
        // elevation: 0,
        
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all( 15.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: constants.drawerclor,),
              
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            // vertical: size.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_today_outlined, color: Colors.black),
                  SizedBox(width: 5),
                  Text(
                    '24-07-2025',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    '04:03 PM', // Current time
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: size.width,
                height: size.height * 0.07,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: constants.cardColor,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: constants.borderColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Heart Rate Detection',
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                      value: _isDetectionOn,
                      onChanged: (value) {
                        setState(() {
                          _isDetectionOn = value;
                        });
                      },
                      // activeColor: Colors.purple[300],
                      inactiveThumbColor: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: size.width,
                height: size.height * 0.25,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: constants.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: constants.borderColor),
                ),
                child: HeartRateChartWidget(title: "Schedule Heart Rate Data"),
              ),
              SizedBox(height: 20),
              Container(
                width: size.width,
                height: size.height * 0.13,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: constants.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: constants.borderColor),
                ),
                child: StatsCard(),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  RecentDataCard(
                    title: "Recent\nData Detail",
                    buttontext: "Click to View",
                  ),

                  RecentDataCard(
                    title: "Real Time\nHeart Rate",
                    buttontext: "Click to Start",
                  ),
                ],
              ),
              SizedBox(height: 20),
              NestedCirclesCard( items: [
                  NestedCircleItem(label: 'Limit', value: 0.9, unit: 'min'),
                  NestedCircleItem(label: 'Anaerobic', value: 0.65, unit: 'min'),
                  NestedCircleItem(label: 'Aerobic', value: 0.75, unit: 'min'),
                  NestedCircleItem(label: 'Fat Burn', value: 0.4, unit: 'min'),
                  NestedCircleItem(label: 'Warm Up', value: 1.0, unit: 'min'),
                ],)
            ],
          ),
        ),
      ),
    );
  }
}
