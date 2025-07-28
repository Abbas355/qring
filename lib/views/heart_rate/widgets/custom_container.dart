import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;

class RecentDataCard extends StatelessWidget {
  String title;
  String buttontext;

  RecentDataCard({super.key,required this.title,required this.buttontext});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: constants.cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(textAlign: TextAlign.center,title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: constants.drawerclor),
              child: Text(buttontext, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}