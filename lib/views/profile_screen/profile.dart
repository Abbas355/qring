import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;
import 'package:qring/utils/image_assets.dart';
import 'package:qring/views/profile_screen/widgets/profile_container.dart';
import 'package:qring/views/profile_screen/widgets/theme_button.dart';

// --- Reusable Custom Widgets ---

/// A general-purpose setting tile with an icon, title, and an optional arrow.

/// A setting tile specifically for a toggle switch.

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // State for the toggle switch
  bool _isLowerBatteryPromptEnabled = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100], // Light background for the screen
        appBar: AppBar(
          title: const Text(
            'User',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              // Find Ring
              CustomContainer(
                icon: ImageAssets
                    .profile['find']!, // Placeholder icon, adjust as needed
                title: 'Find Ring',
                onTap: () {
                  print('Find Ring tapped');
                  // Navigate to Find Ring screen
                },
              ),
              // Theme
              CustomContainer(
                icon: ImageAssets.profile['theme']!, // Placeholder icon
                title: 'Theme',
                trailing: DayNightToggleButton(
                  // optional: handle state with a callback
                  onChanged: (isDay) {
                    print('Theme toggled to ${isDay ? 'Day' : 'Night'}');
                    // Optional: Add theme logic here
                  },
                ),
                onTap: () {
                  print('Theme tapped');

                  // Navigate to Theme settings
                },
              ),

              CustomContainer(
                icon: ImageAssets.profile['unit']!,
                title: 'Unit Format',
                subtitle: 'Metric System',
              ),

              CustomContainer(
                icon: ImageAssets.profile['battery']!,
                title: 'Low Battery Prompt',
                initialValue: true,
                onChanged: (val) => print("Switch: $val"),
              ),
              // Health Connect
              CustomContainer(
                icon: ImageAssets.profile['health']!, // Placeholder icon
                title: 'Health Connect',
                onTap: () {
                  print('Health Connect tapped');
                  // Navigate to Health Connect settings
                },
              ),
              // Background operation Protection guide
              CustomContainer(
                icon: ImageAssets.profile['protection']!, // Placeholder icon
                title: 'Background operation Protection guide',
                onTap: () {
                  print('Background operation Protection guide tapped');
                  // Navigate to guide
                },
              ),
              // Firmware Upgrade
              CustomContainer(
                icon: ImageAssets.profile['firmware']!, // Placeholder icon
                title: 'Firmware Upgrade',
                onTap: () {
                  print('Firmware Upgrade tapped');
                  // Navigate to firmware upgrade
                },
              ),
              // System Setting
              CustomContainer(
                icon: ImageAssets.profile['setting']!, // Placeholder icon
                title: 'System Setting',
                onTap: () {
                  print('System Setting tapped');
                  // Navigate to system settings
                },
              ),
              // FAQs
              CustomContainer(
                icon: ImageAssets.profile['faq']!, // Placeholder icon
                title: 'FAQs',
                onTap: () {
                  print('FAQs tapped');
                  // Navigate to FAQs
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
