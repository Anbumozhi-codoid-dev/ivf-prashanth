
import 'package:ivf/Utils/AllImports.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class ClockLikeProgressIndicator extends StatelessWidget {
  final int totalHours;
  final int currentHour;

  ClockLikeProgressIndicator({required this.totalHours, required this.currentHour});

  @override
  Widget build(BuildContext context) {
    double progress = currentHour / totalHours;

    return CustomPaint(
      size: Size(200, 200), // Adjust the size as needed
      painter: GradientCircularProgressPainter(
        progress: progress,
        startColor: Color(0xFFF555A2),
        endColor: Color(0xFF752B8E),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Progress",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$currentHour/$totalHours",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  final double progress;
  final Color startColor;
  final Color endColor;

  GradientCircularProgressPainter({
    required this.progress,
    required this.startColor,
    required this.endColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2 - 0;

    // Draw the background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Create a gradient for the progress
    Paint progressPaint = Paint()
      ..shader = SweepGradient(
        startAngle: -math.pi / 2,
        endAngle: 2 * math.pi * progress - math.pi / 2,
        colors: [startColor, endColor],
        stops: [0.0, 1.0],
      ).createShader(Rect.fromCircle(
        center: center,
        radius: radius,
      ))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
