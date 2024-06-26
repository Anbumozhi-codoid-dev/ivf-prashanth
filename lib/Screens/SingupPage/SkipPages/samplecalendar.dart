import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ivf/Utils/AllImports.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'dart:ui' as ui;

class CustomCalendar extends StatefulWidget {
  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  DateTime? _focusedDate;
  List<DateTime> _daysInMonth = [];

  @override
  void initState() {
    super.initState();
    _focusedDate = DateTime.now();
    _daysInMonth = _generateDaysInMonth(_focusedDate!);
  }

  List<DateTime> _generateDaysInMonth(DateTime date) {
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
    final firstDayOfCalendar = firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday % 7));
    final lastDayOfCalendar = lastDayOfMonth.add(Duration(days: 6 - (lastDayOfMonth.weekday % 7)));

    return List<DateTime>.generate(
      lastDayOfCalendar.difference(firstDayOfCalendar).inDays + 1,
          (index) => firstDayOfCalendar.add(Duration(days: index)),
    );
  }

  bool _isWithinSelectedRange(DateTime day) {
    if (_selectedStartDate == null || _selectedEndDate == null) {
      return false;
    }
    return day.isAfter(_selectedStartDate!) && day.isBefore(_selectedEndDate!) ||
        day.isAtSameMomentAs(_selectedStartDate!) ||
        day.isAtSameMomentAs(_selectedEndDate!);
  }

  void _onDayTapped(DateTime day) {
    setState(() {
      if (_selectedStartDate == null || (_selectedStartDate != null && _selectedEndDate != null)) {
        _selectedStartDate = day;
        _selectedEndDate = null;
      } else if (_selectedStartDate != null && _selectedEndDate == null) {
        if (day.isBefore(_selectedStartDate!)) {
          _selectedEndDate = _selectedStartDate;
          _selectedStartDate = day;
        } else {
          _selectedEndDate = day;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Calendar')),
      body: Column(
        children: [
          _buildCalendarHeader(),
          _buildDayLabels(),
          _buildCalendarDays(),
          if (_selectedStartDate != null && _selectedEndDate != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Selected range: ${DateFormat('yyyy-MM-dd').format(_selectedStartDate!)} - ${DateFormat('yyyy-MM-dd').format(_selectedEndDate!)}',
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                _focusedDate = DateTime(_focusedDate!.year, _focusedDate!.month - 1);
                _daysInMonth = _generateDaysInMonth(_focusedDate!);
              });
            },
          ),
          Text(
            DateFormat.yMMM().format(_focusedDate!),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              setState(() {
                _focusedDate = DateTime(_focusedDate!.year, _focusedDate!.month + 1);
                _daysInMonth = _generateDaysInMonth(_focusedDate!);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDayLabels() {
    final daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: daysOfWeek.map((day) {
        return Expanded(
          child: Center(
            child: Text(
              day,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarDays() {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        itemCount: _daysInMonth.length,
        itemBuilder: (context, index) {
          final day = _daysInMonth[index];
          final isSelected = _isWithinSelectedRange(day);
          final isToday = DateTime.now().day == day.day && DateTime.now().month == day.month && DateTime.now().year == day.year;
          final isCurrentMonth = _focusedDate!.month == day.month;

          return GestureDetector(
            onTap: () => _onDayTapped(day),
            child: CustomPaint(
              painter: isSelected ? SelectedDatePainter() : null,
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.withOpacity(0.5) : isToday ? Colors.grey.shade300 : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                  border: isSelected ? Border.all(color: Colors.blue) : null,
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: isCurrentMonth ? Colors.black : Colors.grey,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SelectedDatePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.bloodLineRed
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class WaterDropPainter extends CustomPainter {
  final String dayText;

  WaterDropPainter(this.dayText);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red // Replace with your desired color
      ..style = PaintingStyle.stroke;

    Path path = Path();
    double controlPointOffset = size.width / 0.5;

    path.moveTo(size.width / 1, size.height);
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
        style: TextStyle(color: Colors.white, fontSize: 14.0),
      ),
      textDirection: ui.TextDirection.ltr,
    );

    textPainter.layout();
    double textWidth = textPainter.width;
    double textHeight = textPainter.height;

    // Position the text in the center of the water drop shape
    Offset textOffset = Offset(
      (size.width - textWidth) / 2,
      (size.height - textHeight) / 2,
    );

    textPainter.paint(canvas, textOffset);

    canvas.restore(); // Restore the canvas state after clipping
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


