// recent_activity_card.dart
import 'package:flutter/material.dart';

class RecentActivityCard extends StatelessWidget {
  const RecentActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Recent Activities', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const Spacer(),
            Column(
              children: [
                Image.asset('assets/nodata.png', height: 100),
                const SizedBox(height: 10),
                const Text('No Data Yet', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
