import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;
import 'package:qring/utils/image_assets.dart';

class SleepScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Total Score',
                  style: constants.dateStyle,
                ),
                Text(
                  '73%',
                  style: 
                  TextStyle(fontSize: 32,color: constants.drawerclor)
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Duration',
                  style: constants.dateStyle,
                ),
                SizedBox(height: 10,),
                Text(
                  '_ _ H _ _ M',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        Divider(color: Colors.black.withAlpha(100),thickness: 0.5,),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(ImageAssets.icons['efficency']!,height: 20,),
                    SizedBox(width: 4),
                    Text(
                      '_ _',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Text("Sleep Efficiency",style: TextStyle(color: Colors.black38))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(ImageAssets.icons['quality']!,height: 20,),
                    SizedBox(width: 4),
                    Text(
                      '_ _',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Text("Sleep Quality",style: TextStyle(color: Colors.black38),)
              ],
            ),
          ],
        ),
       
        
        
      ],
    );
  }
}

