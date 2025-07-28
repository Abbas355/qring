import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:qring/utils/constants.dart' as constants;

class SleepStageChartWidget extends StatelessWidget {
  final int wakeuptime;   // in minutes
  final int deepsleep;    // deep sleep in minutes
  final int lightsleep;   // in minutes

  const SleepStageChartWidget({
    super.key,
    required this.wakeuptime,
    required this.lightsleep,
    required this.deepsleep,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Convert minutes to hours in double (e.g., 90 mins => 1.5)
    final Map<String, double> dataMap = {
      "Wake Up Time": wakeuptime / 60,
      "Light Sleep Time": lightsleep / 60,
      "Deep Sleep Time": deepsleep / 60,
    };

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: [
          PieChart(
            dataMap: dataMap,
            chartRadius: 80,
            colorList: [
              constants.wakeUpColor,
              constants.watercolor,
              constants.waterbar,
            ],
            chartType: ChartType.ring,
            ringStrokeWidth: 35,
            centerText: "",
            legendOptions: LegendOptions(showLegends: false),
            chartValuesOptions: ChartValuesOptions(showChartValues: false),
          ),
          SizedBox(height: size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLegend(
                _formatTime(wakeuptime),
                'Wake Up\n Time',
                constants.wakeUpColor,
              ),
              _buildLegend(
                _formatTime(lightsleep),
                'Light Sleep\n Time',
                constants.watercolor,
              ),
              _buildLegend(
                _formatTime(deepsleep),
                'Deep Sleep\n Time',
                constants.waterbar,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Formats minutes into "HHH H MMM M" style
  String _formatTime(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return "${hours.toString().padLeft(2, '0')}H ${mins.toString().padLeft(2, '0')}M";
  }

  Widget _buildLegend(String title, String label, Color color) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: color,
          ),
        ),
        SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 12, color: Colors.black)),
            Text(label, style: constants.smallTextStyle),
          ],
        ),
      ],
    );
  }
}
