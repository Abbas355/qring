import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;

enum TimePeriod { day, week, month }

class ArrowSelectorDemo extends StatefulWidget {
  final ValueChanged<TimePeriod>? onChanged;
  const ArrowSelectorDemo({super.key, this.onChanged});

  @override
  State<ArrowSelectorDemo> createState() => _ArrowSelectorDemoState();
}

class _ArrowSelectorDemoState extends State<ArrowSelectorDemo> {
  TimePeriod selected = TimePeriod.day;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: 50,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          // color: Colors.transparent,
          // borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.2),
            //   spreadRadius: 1,
            //   blurRadius: 3,
            //   offset: const Offset(0, 2),
            // ),
          ],
        ),
        child: Row(
          children: [
            _buildSegment(TimePeriod.day, 'Day', isFirst: true, isLast: false),
            _buildSegment(
              TimePeriod.week,
              'Week',
              isFirst: false,
              isLast: false,
            ),
            _buildSegment(
              TimePeriod.month,
              'Month',
              isFirst: false,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSegment(
    TimePeriod period,
    String text, {
    required bool isFirst,
    required bool isLast,
  }) {
    final isSelected = selected == period;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selected = period);
          widget.onChanged?.call(period);
        },
        child: CustomPaint(
          painter: ArrowPainter(
            isFirst: isFirst,
            isLast: isLast,
            isSelected: isSelected,
            fillColor: isSelected ? constants.drawerclor : Colors.white!,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ArrowPainter extends CustomPainter {
  final bool isFirst;
  final bool isLast;
  final bool isSelected;
  final Color fillColor;

  ArrowPainter({
    required this.isFirst,
    required this.isLast,
    required this.isSelected,
    required this.fillColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final Path path = Path();

    final double arrowheadWidth = size.width * 0.15;
    final double barHeight = size.height;
    final double barYOffset = (size.height - barHeight) / 2;

    if (isFirst) {
      path.moveTo(0, 0);
      path.lineTo(size.width + 16, 0); // change this for first arrow up side
      // path.lineTo(size.width, size.height / 2);
      path.lineTo(
        size.width + 16,
        size.height,
      ); // chage this for front arrow down side
      path.lineTo(0, size.height);
      path.lineTo(0, size.height / 2);
    } else {
      path.moveTo(arrowheadWidth, size.height / 2);
      path.lineTo(-16, barYOffset); //change this x axis -16
      path.lineTo(size.width - arrowheadWidth, barYOffset);
      path.lineTo(size.width + 16, size.height / 2);
      path.lineTo(size.width - arrowheadWidth, barYOffset + barHeight);
      path.lineTo(-16, barYOffset + barHeight); // chage this x axis -16
      path.lineTo(arrowheadWidth, size.height / 2);
    }

    path.close();
    canvas.drawPath(path, paint);

    // Border when not selected
    if (!isSelected) {
      final Paint borderPaint = Paint()
        ..color = Colors.grey[400]!
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;
      canvas.drawPath(path, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
