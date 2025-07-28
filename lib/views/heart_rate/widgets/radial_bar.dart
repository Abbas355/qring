import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const CustomCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: padding,
      // REMOVED: height: 300,
      decoration: BoxDecoration(
        color: constants.cardColor,

        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}

// Data model for each item in the nested circle chart.
class NestedCircleItem {
  final String label;
  final double value; // Progress for the arc, from 0.0 to 1.0.
  final String unit;
  final Color? color;

  NestedCircleItem({
    required this.label,
    required this.value,
    required this.unit,
    this.color,
  });
}

/// A card that displays a legend and a responsive nested circle chart.
///
/// Its height dynamically adjusts to fit the content.
class NestedCirclesCard extends StatelessWidget {
  final List<NestedCircleItem> items;

  // Default colors are used when an item's color is null.
  final List<Color> _defaultColors = [
    Colors.blue,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.green,
  ];

  NestedCirclesCard({super.key, required this.items})
    : assert(
        items.length <= 5,
        'NestedCirclesCard can display a maximum of 5 items.',
      );

  @override
  Widget build(BuildContext context) {
    return  CustomCard(
  padding: const EdgeInsets.all(20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Top Section: Concentric Rings Chart
      Center(
        child: AspectRatio(
          aspectRatio: 2,
          child: CustomPaint(
            painter: _ConcentricArcsPainter(
              items: items,
              defaultColors: _defaultColors,
            ),
          ),
        ),
      ),
      const SizedBox(height: 24),

      // Middle Section: Info Rows for each item
      // Middle Section: Info Rows (2 per row)
...List.generate((items.length / 2).ceil(), (i) {
  final firstItem = items[i * 2];
  final secondIndex = i * 2 + 1;
  final secondItem = secondIndex < items.length ? items[secondIndex] : null;

  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      // First item
      Expanded(
        child: _buildInfoRow(
          firstItem.color ?? _defaultColors[i * 2 % _defaultColors.length],
          firstItem.label,
          firstItem.value,
          firstItem.unit,
        ),
      ),
      const SizedBox(width: 8),
      // Second item (if exists)
      if (secondItem != null)
        Expanded(
          child: _buildInfoRow(
            secondItem.color ??
                _defaultColors[secondIndex % _defaultColors.length],
            secondItem.label,
            secondItem.value,
            secondItem.unit,
          ),
        )
      else
        const Expanded(child: SizedBox()), // keep spacing consistent
    ],
  );
}),


      // const SizedBox(height: 10),

      // Bottom Section: Note
      const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.info_outline,
            color: Colors.black,
            size: 20,
          ),
          SizedBox(width: 8),
          Text(
            'Note',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    ],
  ),
);

  }

  /// Builds a single row in the legend list.
  Widget _buildInfoRow(Color color, String label, double value, String unit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 10),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: 12),
          Text(
            '${(value * 100).toStringAsFixed(0)} $unit',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom Painter for the Concentric Arcs Chart.
class _ConcentricArcsPainter extends CustomPainter {
  final List<NestedCircleItem> items;
  final List<Color> defaultColors;

  _ConcentricArcsPainter({required this.items, required this.defaultColors});

  final List<Map<String, double>> _arcStyleConfig = const [
    {'radiusFactor': 1.0, 'strokeWidth': 7.0},
    {'radiusFactor': 0.8, 'strokeWidth': 6.0},
    {'radiusFactor': 0.64, 'strokeWidth': 5.0},
    {'radiusFactor': 0.46, 'strokeWidth': 4.0},
    {'radiusFactor': 0.28, 'strokeWidth': 3.0},
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const double maxSweepAngle = math.pi * 2;
    const double startAngle = -math.pi / 2 + (2 * math.pi - maxSweepAngle) / 2;

    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      final style = _arcStyleConfig[i];
      final Color color = item.color ?? defaultColors[i % defaultColors.length];
      final double radius = size.shortestSide / 2 * (style['radiusFactor']!);
      final double strokeWidth = style['strokeWidth']!;
      final double progress = item.value.clamp(0.0, 1.0);
      final double sweepAngle = maxSweepAngle * progress;
      final rect = Rect.fromCircle(center: center, radius: radius);

      final backgroundPaint = Paint()
        ..color = color.withOpacity(0.2)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(rect, startAngle, maxSweepAngle, false, backgroundPaint);

      if (progress > 0) {
        final foregroundPaint = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;
        canvas.drawArc(rect, startAngle, sweepAngle, false, foregroundPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ConcentricArcsPainter oldDelegate) {
    return oldDelegate.items != items;
  }
}

