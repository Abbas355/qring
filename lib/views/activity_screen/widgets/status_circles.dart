  // Custom Painter for the circular progress indicator (unchanged)
  import 'package:flutter/material.dart';

  class ProgressCircle extends CustomPainter {
    final double progress;
    final double strokeWidth;
    final Color backgroundColor;
    final Color progressColor;

    ProgressCircle({
      required this.progress,
      required this.strokeWidth,
      required this.backgroundColor,
      required this.progressColor,
    });

    @override
    void paint(Canvas canvas, Size size) {
      final center = Offset(size.width / 2, size.height / 2);
      final radius = (size.width - strokeWidth) / 2;

      // Draw shadow circle
      final shadowPaint = Paint()
        ..color = Colors.black.withOpacity(0.2)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);
      canvas.drawCircle(center.translate(0, 2), radius, shadowPaint);

      // Background circle
      final backgroundPaint = Paint()
        ..color = backgroundColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;
      canvas.drawCircle(center, radius, backgroundPaint);

      // Progress arc
      final progressPaint = Paint()
        ..color = progressColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      final arcAngle = 2 * 3.1415926535 * progress;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -3.1415926535 / 2,
        arcAngle,
        false,
        progressPaint,
      );
    }

    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      if (oldDelegate is ProgressCircle) {
        return oldDelegate.progress != progress ||
            oldDelegate.strokeWidth != strokeWidth ||
            oldDelegate.backgroundColor != backgroundColor ||
            oldDelegate.progressColor != progressColor;
      }
      return true;
    }
  }

  ////////////with label

  class ProgressCircleWithLabel extends StatelessWidget {
    final double progress;
    final double strokeWidth;
    final Color backgroundColor;
    final Color progressColor;
    final Widget? label;

    const ProgressCircleWithLabel({
      super.key,
      required this.progress,
      required this.strokeWidth,
      required this.backgroundColor,
      required this.progressColor,
      this.label,
    });

    @override
    Widget build(BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size.square(60),
                painter: ProgressCircle(
                  progress: progress,
                  strokeWidth: strokeWidth,
                  backgroundColor: backgroundColor,
                  progressColor: progressColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          if (label != null)
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: progressColor,
                height: 1.5,
                fontWeight: FontWeight.bold,
              ),
              child: label!,
            ),
        ],
      );
    }
  }