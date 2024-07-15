import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ivf/Utils/AllImports.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'AppTheme.dart';


class CircularProgressCustom extends StatelessWidget {
  final double progress;
  final String centerText;
  final ImageProvider startImage;
  final ImageProvider endImage;
  final Color startColor;
  final Color endColor;

  CircularProgressCustom({
    required this.progress,
    required this.centerText,
    required this.startImage,
    required this.endImage,
    required this.startColor,
    required this.endColor,
  });

  Future<ui.Image> _loadImage(ImageProvider provider) async {
    final completer = Completer<ui.Image>();
    final stream = provider.resolve(ImageConfiguration.empty);
    final listener = ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    });
    stream.addListener(listener);
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        _loadImage(startImage),
        _loadImage(endImage),
      ]),
      builder: (context, AsyncSnapshot<List<ui.Image>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return CustomPaint(
            size: Size(200, 200),
            painter: _CircularProgressCustomPainter(
              progress: progress,
              startImage: snapshot.data![0],
              endImage: snapshot.data![1],
              startColor: startColor,
              endColor: endColor, centerText: centerText,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonUI().myText(text:
                    centerText,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.themePink),
                    Gap(1.w),
                    CommonUI().myText(text: "Hr",fontWeight: FontWeight.w600,
                    fontSize: 11.sp, color: AppTheme.themePink,)
                  ],
                ),
                CommonUI().myText(text: "30 min",
                fontSize: 9.sp,
                  fontWeight: FontWeight.w500,

                )
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}


////old working
// class CircularProgressCustom extends StatelessWidget {
//   final double progress;
//   final String centerText;
//   final ImageProvider startImage;
//   final ImageProvider endImage;
//   final Color startColor;
//   final Color endColor;
//
//   CircularProgressCustom({
//     required this.progress,
//     required this.centerText,
//     required this.startImage,
//     required this.endImage,
//     required this.startColor,
//     required this.endColor,
//   });
//
//   Future<ui.Image> _loadImage(ImageProvider provider) async {
//     final completer = Completer<ui.Image>();
//     final stream = provider.resolve(ImageConfiguration.empty);
//     final listener = ImageStreamListener((ImageInfo info, bool _) {
//       completer.complete(info.image);
//     });
//     stream.addListener(listener);
//     return completer.future;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Future.wait([
//         _loadImage(startImage),
//         _loadImage(endImage),
//       ]),
//       builder: (context, AsyncSnapshot<List<ui.Image>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
//           return CustomPaint(
//             size: Size(200, 200),
//             painter: _CircularProgressCustomPainter(
//               progress: progress,
//               startImage: snapshot.data![0],
//               endImage: snapshot.data![1],
//               startColor: startColor,
//               endColor: endColor,
//             ),
//             child: Center(
//               child: Text(
//                 centerText,
//                 style: TextStyle(
//                   fontSize: 24,
//                   color: Colors.purple,
//                 ),
//               ),
//             ),
//           );
//         }
//         else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }


class _CircularProgressCustomPainter extends CustomPainter {
  final double progress;
  final ui.Image startImage;
  final ui.Image endImage;
  final Color startColor;
  final Color endColor;
  final String centerText;

  _CircularProgressCustomPainter({
    required this.progress,
    required this.startImage,
    required this.endImage,
    required this.startColor,
    required this.endColor,
    required this.centerText,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    Paint progressPaint = Paint()
      ..shader = LinearGradient(
        colors: [startColor, endColor],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2 - 45, // Adjusted radius
      ))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round;

    Paint dashPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    double radius = size.width / 2 - 45; // Adjusted radius
    Offset center = Offset(size.width / 2, size.height / 2);
    double sweepAngle = 2 * math.pi * progress;

    // Draw the background circle
    canvas.drawCircle(center, radius, circlePaint);

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );

    // Draw the inner 8-dash needle
    for (int i = 0; i < 8; i++) {
      double angle = 2 * math.pi / 8 * i;
      Offset start = Offset(
        center.dx + radius * 0.75 * math.cos(angle),
        center.dy + radius * 0.75 * math.sin(angle),
      );
      Offset end = Offset(
        center.dx + radius * 0.9 * math.cos(angle),
        center.dy + radius * 0.9 * math.sin(angle),
      );
      canvas.drawLine(start, end, dashPaint);
    }

    // Draw the start and end images
    _drawImageAtAngle(canvas, size, startImage, -math.pi / 2);
    _drawImageAtAngle(canvas, size, endImage, -math.pi / 2 + sweepAngle);

    // Draw center text
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: centerText,
        style: TextStyle(
          color: Colors.purple,
          fontSize: 20,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    // textPainter.paint(canvas, Offset(center.dx - textPainter.width / 2, center.dy - textPainter.height / 2));
  }

  void _drawImageAtAngle(Canvas canvas, Size size, ui.Image image, double angle) {
    double radius = size.width / 2 - 45; // Adjusted radius
    Offset center = Offset(size.width / 2, size.height / 2);

    final imageSize = Size(15, 15);  // adjust the image size
    final imageOffset = Offset(
      center.dx + radius * math.cos(angle) - imageSize.width / 2,
      center.dy + radius * math.sin(angle) - imageSize.height / 2,
    );

    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      imageOffset & imageSize,
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}



////olg working
// class _CircularProgressCustomPainter extends CustomPainter {
//   final double progress;
//   final ui.Image startImage;
//   final ui.Image endImage;
//   final Color startColor;
//   final Color endColor;
//
//   _CircularProgressCustomPainter({
//     required this.progress,
//     required this.startImage,
//     required this.endImage,
//     required this.startColor,
//     required this.endColor,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint circlePaint = Paint()
//       ..color = AppTheme.sleepTrackingBgPurple
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 15;
//
//     Paint progressPaint = Paint()
//       ..shader = LinearGradient(
//         colors: [startColor, endColor],
//       ).createShader(Rect.fromCircle(
//         center: Offset(size.width / 2, size.height / 2),
//         radius: size.width / 2,
//       ))
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 15
//       ..strokeCap = StrokeCap.round;
//
//     Paint dashPaint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;
//
//     double radius = size.width / 2 - 15;
//     Offset center = Offset(size.width / 2, size.height / 2);
//     double sweepAngle = 2 * math.pi * progress;
//
//     // Draw the background circle
//     canvas.drawCircle(center, radius, circlePaint);
//
//     // Draw the progress arc
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       -math.pi / 2,
//       sweepAngle,
//       false,
//       progressPaint,
//     );
//
//     // Draw the inner 8-dash needle
//     for (int i = 0; i < 8; i++) {
//       double angle = 2 * math.pi / 8 * i;
//       Offset start = Offset(
//         center.dx + radius * 0.6 * math.cos(angle),
//         center.dy + radius * 0.6 * math.sin(angle),
//       );
//       Offset end = Offset(
//         center.dx + radius * 0.9 * math.cos(angle),
//         center.dy + radius * 0.9 * math.sin(angle),
//       );
//       canvas.drawLine(start, end, dashPaint);
//     }
//
//     // Draw the start and end images
//     _drawImageAtAngle(canvas, size, startImage, -math.pi / 2);
//     _drawImageAtAngle(canvas, size, endImage, -math.pi / 2 + sweepAngle);
//   }
//
//   void _drawImageAtAngle(Canvas canvas, Size size, ui.Image image, double angle) {
//     double radius = size.width / 2 - 15;
//     Offset center = Offset(size.width / 2, size.height / 2);
//
//     final imageSize = Size(30, 30);  // adjust the image size
//     final imageOffset = Offset(
//       center.dx + radius * math.cos(angle) - imageSize.width / 2,
//       center.dy + radius * math.sin(angle) - imageSize.height / 2,
//     );
//
//     canvas.drawImageRect(
//       image,
//       Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
//       imageOffset & imageSize,
//       Paint(),
//     );
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }


//
// import 'package:ivf/Utils/AllImports.dart';
//
// import 'package:flutter/material.dart';
// import 'dart:math' as math;
//
// class ClockLikeProgressIndicator extends StatelessWidget {
//   final int totalHours;
//   final int currentHour;
//
//   ClockLikeProgressIndicator({required this.totalHours, required this.currentHour});
//
//   @override
//   Widget build(BuildContext context) {
//     double progress = currentHour / totalHours;
//
//     return CustomPaint(
//       size: Size(200, 200), // Adjust the size as needed
//       painter: GradientCircularProgressPainter(
//         progress: progress,
//         startColor: Color(0xFFF555A2),
//         endColor: Color(0xFF752B8E),
//       ),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Progress",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "$currentHour/$totalHours",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 16.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class GradientCircularProgressPainter extends CustomPainter {
//   final double progress;
//   final Color startColor;
//   final Color endColor;
//
//   GradientCircularProgressPainter({
//     required this.progress,
//     required this.startColor,
//     required this.endColor,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint backgroundPaint = Paint()
//       ..color = Colors.grey.withOpacity(0.3)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 20;
//
//     Offset center = Offset(size.width / 2, size.height / 2);
//     double radius = size.width / 2 - 0;
//
//     // Draw the background circle
//     canvas.drawCircle(center, radius, backgroundPaint);
//
//     // Create a gradient for the progress
//     Paint progressPaint = Paint()
//       ..shader = SweepGradient(
//         startAngle: -math.pi / 2,
//         endAngle: 2 * math.pi * progress - math.pi / 2,
//         colors: [startColor, endColor],
//         stops: [0.0, 1.0],
//       ).createShader(Rect.fromCircle(
//         center: center,
//         radius: radius,
//       ))
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 20
//       ..strokeCap = StrokeCap.round;
//
//     // Draw the progress arc
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       -math.pi / 2,
//       2 * math.pi * progress,
//       false,
//       progressPaint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
