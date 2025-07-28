import 'package:flutter/material.dart';
import 'package:qring/utils/image_assets.dart';
import '../../controllers/drawer_controller.dart';
import '../../models/user_model.dart';
import '../../utils/constants.dart' as constants;

class CustomDrawer extends StatelessWidget {
  final VoidCallback onClose;

  CustomDrawer({required this.onClose});

  final controller = DrawerControllerMVC();

  @override
  Widget build(BuildContext context) {
    UserModel user = controller.getCurrentUser();

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,

      decoration: BoxDecoration(
        color: constants.drawerclor,
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: onClose,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(user.profileImage),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              user.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              user.email,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
          Divider(color: Colors.white38, thickness: 1),
          const SizedBox(height: 30),
          drawerItem(
            Image.asset(
              ImageAssets.icons['user']!,
              height: 20,
              width: 20,
              color: Colors
                  .white, // Optional: colorize icon if it's a monochrome PNG
            ),
            "Profile",
          ),
          drawerItem(
            Image.asset(
              ImageAssets.icons['goal']!,
              height: 20,
              width: 20,
              color: Colors
                  .white, // Optional: colorize icon if it's a monochrome PNG
            ),
            "Goal Setting",
          ),
          drawerItem(
            Image.asset(
              ImageAssets.icons['info']!,
              height: 20,
              width: 20,
              color: Colors
                  .white, // Optional: colorize icon if it's a monochrome PNG
            ),
            "About",
          ),
        ],
      ),
    );
  }

  Widget drawerItem(Widget iconWidget, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          iconWidget,
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
