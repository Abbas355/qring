import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top:size.height*0.05),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: [CustomPaint(painter: DashedLinePainter(), child: Container(width: 20, height: 1)), SizedBox(height: 8), Text('Average')]),
          Column(children: [CustomPaint(painter: DashedLinePainter(), child: Container(width: 20, height: 1)), SizedBox(height: 8), Text('Minimum')]),
          Column(children: [CustomPaint(painter: DashedLinePainter(), child: Container(width: 20, height: 1)), SizedBox(height: 8), Text('Maximum')]),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black87..strokeWidth = 1.5..style = PaintingStyle.stroke;
    const dashWidth = 5.0, dashSpace = 3.0;
    double startX = 0;
    while (startX < size.width) { canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint); startX += dashWidth + dashSpace; }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}