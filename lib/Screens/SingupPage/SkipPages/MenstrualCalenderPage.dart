


import 'package:ivf/Screens/SingupPage/SkipPages/ContentWarningPage.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Utils/AllImports.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../CalenderWidget.dart';


class MenstrualCalendarPage extends StatefulWidget {
  const MenstrualCalendarPage({super.key});

  @override
  State<MenstrualCalendarPage> createState() => _MenstrualCalendarPageState();
}

class _MenstrualCalendarPageState extends State<MenstrualCalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  List<DateTime> _selectedRange = [];
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  bool _selectedOption = false;

//for calender
  List<DateTime> selectedDates = [];
  DateTime currentDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    DateTime firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    int daysInMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: 15.h,
              width: 100.w,
              decoration: const BoxDecoration(
                  color: AppTheme.themePink,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
              child: Center(
                child: CommonUI().myText(
                    text: "Last Menstrual Date ?",
                    color: AppTheme.white,
                    fontSize: 16.sp,
                    fontfamily: "Nunito",
                    fontWeight: FontWeight.w700),
              ),
            ),
            Gap(4.h),
            Padding(
              padding: EdgeInsets.fromLTRB(5.w, 0, 3.w, 0),
              child: Container(
                  width: 90.w,
                  height: 60.h,
                  child:
                  Column(
                    children: <Widget>[
                      _buildMonthNavigationRow(),
                      Gap(2.h),
                      _buildDaysOfWeekRow(),
                      _buildDaysGrid(firstDayOfMonth, daysInMonth)
                      // _buildDaysGrid(firstDayOfMonth, daysInMonth),
                    ],
                  )


              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5.w, 0, 3.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonUI().myText(text: "Start Date",
                          fontfamily: "Nunito",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500
                      ),
                      Gap(1.h),
                      CommonUI().textFormField(
                          height: 5.h,
                          width: 40.w,
                          hintText: "start date",
                          hintfontsize: 15.sp,
                          fontsize: 14.sp,
                          show: false,
                          controller: startDateController
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonUI().myText(text: "End Date",
                          fontfamily: "Nunito",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500
                      ),
                      Gap(1.h),
                      CommonUI().textFormField(
                          height: 5.h,
                          width: 40.w,
                          hintText: "end date",
                          hintfontsize: 15.sp,
                          show: false,
                          fontsize: 14.sp,
                          controller: endDateController
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(3.h),
            Padding(
              padding: EdgeInsets.fromLTRB(8.w, 2.h, 3.w, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonUI().myText(text: "Type of Menstrual period",
                          fontWeight: FontWeight.w500,
                          fontfamily: "Nunito",
                          fontSize: 14.sp),
                    ],
                  ),
                  Gap(2.h),

                  Row(
                    children: [
                      SizedBox(width: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            checkColor: AppTheme.white,
                            activeColor: AppTheme.themePink,
                            value: _selectedOption == true,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  _selectedOption = true;
                                } else {
                                  // _selectedOption = null;
                                }
                              });
                            },
                          ),
                          CommonUI().myText(text: "Regulars",
                              fontfamily: "Nunito",
                              fontSize: 13.sp,
                              color: AppTheme.textPink),

                          SizedBox(width: 20),
                          // Add some spacing between the checkboxes
                          Checkbox(
                            checkColor: AppTheme.white,
                            activeColor: AppTheme.themePink,
                            value: _selectedOption == false,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  _selectedOption = false;
                                } else {
                                  // _selectedOption = null;
                                }
                              });
                            },
                          ),
                          CommonUI().myText(text: "Irregulars",
                              fontfamily: "Nunito",
                              fontSize: 13.sp,
                              color: AppTheme.textPink),
                        ],
                      ), // Add some spacing between the checkboxes

                    ],
                  )
                ],
              ),
            ),


          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()));
            },
            child: CommonUI().myText(text: "Skip", color: AppTheme.textPink,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600),
          ),
          Gap(50.w),
          GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => ContentWarningPage()));
              },
              child: Image.asset(AppConstants.circleArrowIcon, scale: 4.5,))
        ],
      ),
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
          CommonUI().myText(
              text: DateFormat.yMMMM().format(currentDate).toUpperCase(),
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
      dayWidgets.add(Container(
      ));
    }

    // Build grid cells for each day in the month
    for (int day = 1; day <= daysInMonth; day++) {
      DateTime currentDate = DateTime(
          firstDayOfMonth.year, firstDayOfMonth.month, day);
      bool isSelected = selectedDates.contains(currentDate);

      dayWidgets.add(GestureDetector(
        onTap: () => _onDaySelected(currentDate),
        child: Container(
          color: Colors.amber,
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
              if (isSelected)
                Positioned.fill(
                  child: CustomPaint(
                    painter: WaterDropPainter(
                        day.toString()
                    ), // Pass the day as text to painter
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
          for (DateTime d = firstDate.add(Duration(days: 1)); d.isBefore(date);
          d = d.add(Duration(days: 1))) {
            selectedDates.add(d);
          }
          print("add");
          selectedDates.add(date);
          print("selectedDates.length");
          print(selectedDates.length);
          print(selectedDates[0]);
          print(selectedDates.last);
          setState(() {
            startDateController.text = selectedDates[0].toString().split(" ")[0];
            endDateController.text = selectedDates.last.toString().split(" ")[0];

          });
        } else if (date.isBefore(firstDate)) {
          // Select range in descending order
          for (DateTime d = firstDate.subtract(Duration(days: 1)); d.isAfter(
              date); d = d.subtract(Duration(days: 1))) {
            selectedDates.add(d);
          }
          print("sub");
          selectedDates.add(date);
          print("selectedDates.length");
          print(selectedDates.length);
          print(selectedDates[0]);
          print(selectedDates.last);
          setState(() {
            startDateController.text = selectedDates[0].toString().split(" ")[0];
            endDateController.text = selectedDates.last.toString().split(" ")[0];

          });
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


class LinePainter extends CustomPainter {
  final List<Offset> points;

  LinePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _rangeStart = null;
//         _rangeEnd = null;
//         _rangeSelectionMode = RangeSelectionMode.toggledOff;
//         _selectedRange.clear();
//       });
//     }
//   }
//
//   void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//     setState(() {
//       _selectedDay = null;
//       _rangeStart = start;
//       _rangeEnd = end;
//       _selectedRange.clear();
//
//       if (start != null && end != null) {
//         DateTime current = start;
//         while (current.isBefore(end) || isSameDay(current, end)) {
//           _selectedRange.add(current);
//           current = current.add(Duration(days: 1));
//         }
//       }
//     });
//   }
//
//   Widget _buildBloodDropDecoration(DateTime day) {
//     return Center(
//       child: CustomPaint(
//         size: Size(40, 40),
//         painter: BloodDropPainter(),
//         child: Center(
//           child: Text(
//             '${day.day}',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }}
//
// class BloodDropPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.fill;
//
//     final path = Path();
//     path.moveTo(size.width / 2, 0);
//     path.quadraticBezierTo(size.width, size.height / 2, size.width / 2, size.height);
//     path.quadraticBezierTo(0, size.height / 2, size.width / 2, 0);
//     path.close();
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }





