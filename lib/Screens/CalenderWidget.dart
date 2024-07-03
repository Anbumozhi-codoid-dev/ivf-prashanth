import 'package:flutter/material.dart';


import 'package:intl/intl.dart';
import 'package:ivf/Utils/AllImports.dart';
import 'dart:ui' as ui;

import '../Utils/AppTheme.dart';// For formatting dates

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Custom Calendar'),
//         ),
//         body: CalendarWidget(),
//       ),
//     );
//   }
// }

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  List<DateTime> selectedDates = [];
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    DateTime firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    int daysInMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;

    return Column(
      children: <Widget>[
        _buildMonthNavigationRow(),
        _buildDaysOfWeekRow(),

        _buildDaysGrid(firstDayOfMonth, daysInMonth),
      ],
    );
  }

  Widget _buildMonthNavigationRow() {
    return Container(
      height: 6.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: AppTheme.themePink, // Background color for the month row
        borderRadius: BorderRadius.circular(4)
      ),
      // padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: _previousMonth,
          ),
          // Text(
          //   DateFormat.yMMMM().format(currentDate),
          //   style: TextStyle(color: Colors.white, fontSize: 18.0),
          // ),
          CommonUI().myText(text: DateFormat.yMMMM().format(currentDate).toUpperCase(),
          color: AppTheme.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            fontfamily: "Nunito"
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: _nextMonth,
          ),
        ],
      ),
    );
  }

  Widget _buildDaysOfWeekRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <String>['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
          .map((day) => Text(day))
          .toList(),
    );
  }
  Widget _buildDaysGrid(DateTime firstDayOfMonth, int daysInMonth) {
    int firstWeekday = firstDayOfMonth.weekday % 7;
    List<Widget> dayWidgets = [];

    // Fill empty cells before the first day of the month
    for (int i = 0; i < firstWeekday; i++) {
      dayWidgets.add(Container());
    }

    // Build grid cells for each day in the month
    for (int day = 1; day <= daysInMonth; day++) {
      DateTime currentDate = DateTime(firstDayOfMonth.year, firstDayOfMonth.month, day);
      bool isSelected = selectedDates.contains(currentDate);

      dayWidgets.add(GestureDetector(
        onTap: () => _onDaySelected(currentDate),
        child: Container(
          margin: EdgeInsets.all(4.0),
          child: Stack(
            children: [
              Center(
                child: Text(
                  day.toString(),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    }

    return Expanded(
      child: GridView.count(
        crossAxisCount: 7,
        children: dayWidgets,
      ),
    );
  }



  void _onDaySelected(DateTime date) {
    setState(() {
      if (selectedDates.isEmpty) {
        selectedDates.add(date);
      }
      else if (selectedDates.length == 1) {
        DateTime firstDate = selectedDates.first;
        if (date.isAfter(firstDate)) {
          // Select range in ascending order
          for (DateTime d = firstDate.add(Duration(days: 1)); d.isBefore(date); d = d.add(Duration(days: 1))) {
            selectedDates.add(d);
          }
          print("add");
          selectedDates.add(date);
          print("selectedDates.length");
          print(selectedDates.length);
          print(selectedDates[0]);
          print(selectedDates.last);
        } else if (date.isBefore(firstDate)) {
          // Select range in descending order
          for (DateTime d = firstDate.subtract(Duration(days: 1)); d.isAfter(date); d = d.subtract(Duration(days: 1))) {
            selectedDates.add(d);
          }

          selectedDates.add(date);


        }
      }

      else {
        // Clear selection if tapping on a different day after selecting a range
        selectedDates.clear();
        selectedDates.add(date);
      }


    });
  }

  void _previousMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month + 1, 1);
    });
  }
}

class WaterDropPainter extends CustomPainter {
  final String dayText;
  final bool isTab;

  WaterDropPainter(this.dayText, this.isTab);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red // Replace with your desired color
      ..style = PaintingStyle.fill;

    Path path = Path();
    double controlPointOffset = size.width / 1.5;

    path.moveTo(size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width / 2 + controlPointOffset, size.height / 1.3, size.width / 2, 0);
    path.quadraticBezierTo(
        size.width / 2 - controlPointOffset, size.height / 1.3, size.width / 2, size.height);
    path.close();

    canvas.save(); // Save the current canvas state

    // Clip canvas to the shape of the water drop
    canvas.clipPath(path);

    // Draw the water drop shape
    canvas.drawPath(path, paint);

    // Draw the text inside the water drop shape
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: dayText,
        style: TextStyle(color: Colors.white, fontSize: isTab ? 10.sp : 10.sp),
      ),
      // textDirection: TextDirection.LTR,
      // Update here
        textDirection: ui.TextDirection.rtl
    );

    textPainter.layout();
    double textWidth = textPainter.width;
    double textHeight = textPainter.height;

    // Position the text in the center of the water drop shape
    Offset textOffset = Offset(
      size.width / 1.9 - textWidth / 1.8,
      size.height / 1.9 - textHeight / 3,
    );

    textPainter.paint(canvas, textOffset);

    canvas.restore(); // Restore the canvas state after clipping
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


// class CalendarWidget extends StatefulWidget {
//   @override
//   _CalendarWidgetState createState() => _CalendarWidgetState();
// }
//
// class _CalendarWidgetState extends State<CalendarWidget> {
//   List<DateTime> selectedDates = [];
//
//   @override
//   Widget build(BuildContext context) {
//     DateTime now = DateTime.now();
//     DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
//     int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
//
//     return Column(
//       children: <Widget>[
//         _buildDaysOfWeekRow(),
//         _buildDaysGrid(firstDayOfMonth, daysInMonth),
//       ],
//     );
//   }
//
//   Widget _buildDaysOfWeekRow() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <String>['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
//           .map((day) => Text(day))
//           .toList(),
//     );
//   }
//
//
//
//   Widget _buildDaysGrid(DateTime firstDayOfMonth, int daysInMonth) {
//     int firstWeekday = firstDayOfMonth.weekday % 7;
//     List<Widget> dayWidgets = [];
//
//     // Fill empty cells before the first day of the month
//     for (int i = 0; i < firstWeekday; i++) {
//       dayWidgets.add(Container());
//     }
//
//     // Build grid cells for each day in the month
//     for (int day = 1; day <= daysInMonth; day++) {
//       DateTime currentDate =
//       DateTime(firstDayOfMonth.year, firstDayOfMonth.month, day);
//       bool isSelected = selectedDates.contains(currentDate);
//
//       dayWidgets.add(GestureDetector(
//         onTap: () => _onDaySelected(currentDate),
//         child: Container(
//           margin: EdgeInsets.all(4.0),
//           child: Stack(
//             children: [
//               Center(
//                 child: Text(
//                   day.toString(),
//                   style: TextStyle(
//                     color: isSelected ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ),
//               if (isSelected)
//                 Positioned.fill(
//                   child: CustomPaint(
//                     painter: WaterDropPainter(day.toString()), // Pass the day as text to painter
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ));
//     }
//
//     // Draw horizontal lines between selected dates
//     for (int i = 0; i < selectedDates.length - 1; i++) {
//       DateTime currentDate = selectedDates[i];
//       DateTime nextDate = selectedDates[i + 1];
//       if (currentDate.day != nextDate.day - 1) {
//         // If there is a gap between selected dates, draw a horizontal line
//         int startDay = currentDate.day;
//         int endDay = nextDate.day;
//
//         // Calculate the position in the grid for the starting day
//         int rowIndex = (startDay + firstWeekday - 1) ~/ 7;
//         int colIndex = (startDay + firstWeekday - 1) % 7;
//
//         dayWidgets[startDay + firstWeekday - 1] = Stack(
//           children: [
//             dayWidgets[startDay + firstWeekday - 1], // Original container
//             Positioned(
//               left: colIndex * 40.0,
//               top: rowIndex * 40.0 + 20.0, // Adjust the position as needed
//               child: Container(
//                 width: 40.0,
//                 height: 2.0, // Adjust the height of the line as needed
//                 color: Colors.blue, // Adjust the color of the line as needed
//               ),
//             ),
//           ],
//         );
//       }
//     }
//
//     return Expanded(
//       child: GridView.count(
//         crossAxisCount: 7,
//         children: dayWidgets,
//       ),
//     );
//   }
//
//   bool _shouldDrawConnectingLine(DateTime currentDate) {
//     int currentIndex = selectedDates.indexOf(currentDate);
//     if (currentIndex != -1 && currentIndex < selectedDates.length - 1) {
//       DateTime nextDate = selectedDates[currentIndex + 1];
//       int daysBetween = nextDate.difference(currentDate).inDays;
//       return daysBetween > 1;
//     }
//     return false;
//   }
//
//
//   void _onDaySelected(DateTime date) {
//     setState(() {
//       if (selectedDates.isEmpty) {
//         selectedDates.add(date);
//       } else if (selectedDates.length == 1) {
//         DateTime firstDate = selectedDates.first;
//         if (date.isAfter(firstDate)) {
//           // Select range in ascending order
//           for (DateTime d = firstDate.add(Duration(days: 1)); d.isBefore(date); d = d.add(Duration(days: 1))) {
//             selectedDates.add(d);
//           }
//           selectedDates.add(date);
//         } else if (date.isBefore(firstDate)) {
//           // Select range in descending order
//           for (DateTime d = firstDate.subtract(Duration(days: 1)); d.isAfter(date); d = d.subtract(Duration(days: 1))) {
//             selectedDates.add(d);
//           }
//           selectedDates.add(date);
//         }
//       } else {
//         // Clear selection if tapping on a different day after selecting a range
//         selectedDates.clear();
//         selectedDates.add(date);
//       }
//     });
//   }
// }
//
// class ConnectingLinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue // Adjust color as needed
//       ..strokeWidth = 2.0
//       ..style = PaintingStyle.stroke;
//
//     canvas.drawLine(
//       Offset(size.width / 2, 0),
//       Offset(size.width / 2, size.height),
//       paint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

// class WaterDropPainter extends CustomPainter {
//   final String dayText;
//
//   WaterDropPainter(this.dayText);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.red // Replace with your desired color
//       ..style = PaintingStyle.fill;
//
//     Path path = Path();
//     double controlPointOffset = size.width / 1.5;
//
//     path.moveTo(size.width / 2, size.height);
//     path.quadraticBezierTo(
//         size.width / 2 + controlPointOffset, size.height / 1.3, size.width / 2, 0);
//     path.quadraticBezierTo(
//         size.width / 2 - controlPointOffset, size.height / 1.3, size.width / 2, size.height);
//     path.close();
//
//     canvas.save(); // Save the current canvas state
//
//     // Clip canvas to the shape of the water drop
//     canvas.clipPath(path);
//
//     // Draw the water drop shape
//     canvas.drawPath(path, paint);
//
//     // Draw the text inside the water drop shape
//     TextPainter textPainter = TextPainter(
//       text: TextSpan(
//         text: dayText,
//         style: TextStyle(color: Colors.white, fontSize: 14.0),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//
//     textPainter.layout();
//     double textWidth = textPainter.width;
//     double textHeight = textPainter.height;
//
//     // Position the text in the center of the water drop shape
//     Offset textOffset = Offset(
//       size.width / 1.6 - textWidth / 1.8,
//       size.height / 1.7 - textHeight / 3,
//     );
//
//     textPainter.paint(canvas, textOffset);
//
//     canvas.restore(); // Restore the canvas state after clipping
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

