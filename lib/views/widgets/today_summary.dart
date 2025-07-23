import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qring/utils/image_assets.dart';
import '../../controllers/health_controller.dart';
import '../../models/today_summary_model.dart';
import '../../utils/constants.dart' as constants;
import '../../utils/strings.dart' as strings;

class TodaySummary extends StatelessWidget {
  final HealthController controller;

  const TodaySummary({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final data = controller.todaySummary;
    final formattedDate = DateFormat('EEEE, MMM dd').format(DateTime.now());

    return Container(
      width: size.width,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: constants.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: constants.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(strings.todaySection, style: constants.subHeaderStyle),
          SizedBox(height: size.height * 0.01),
          Text(formattedDate, style: constants.dateStyle),
          SizedBox(height: size.height * 0.02),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildStat(
                'Steps',
                '${data.steps}',
                ImageAssets.icons['feet']!,
                constants.feetcolor,
                constants.stepsbar,
              ),
              _buildStat(
                'Water',
                '${data.water}L',
                ImageAssets.icons['water']!,
                constants.watercolor,
                constants.waterbar,
              ),
              _buildStat(
                'Calories',
                '${data.calories}',
                ImageAssets.icons['calories']!,
                constants.caloriescolor,
                constants.caloriebar,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }

  Widget _buildStat(
    String label,
    String value,
    String path,
    Color bgcolor,
    Color barcolor,
  ) {
    final data = controller.todaySummary;
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Image.asset(path, height: 30),
          backgroundColor: bgcolor,
        ),
        Text(value, style: constants.statValueStyle),
        Text(label, style: constants.statLabelStyle),
        SizedBox(height: 10),
        SizedBox(
          width: 73,
          height: 8,
          child: LinearProgressIndicator(
            value: data.steps / 10000,
            color: barcolor,
            backgroundColor: Colors.black.withAlpha(25),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
