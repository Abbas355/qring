import 'package:flutter/material.dart';
import '../../utils/image_assets.dart'; // Import this where icons map is defined

class ActivityCard extends StatelessWidget {
  final String label;
  final Color color;
  final Color iconcolor;
  final String iconKey;

  const ActivityCard({
    super.key,
    required this.label,
    required this.color,
    required this.iconcolor,
    required this.iconKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        height: 83,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: iconcolor,
              borderRadius: BorderRadius.circular(10)
            ),
            
         
            child: Center(
              child: Image.asset(
                ImageAssets.icons[iconKey] ?? '',
                height: 24,
                // width: 24,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: const Text(
            'Please wear a ring to know your activity',
            style: TextStyle(color: Colors.grey),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        ),
      ),
    );
  }
}
