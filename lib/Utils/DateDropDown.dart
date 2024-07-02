import 'package:flutter/material.dart';

class DateDropdownsRow extends StatefulWidget {
  @override
  _DateDropdownsRowState createState() => _DateDropdownsRowState();
}

class _DateDropdownsRowState extends State<DateDropdownsRow> {
  // Lists for dropdown items
  List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July',
    'August', 'September', 'October', 'November', 'December'
  ];

  List<int> days = List<int>.generate(31, (index) => index + 1);

  List<int> years = List<int>.generate(10, (index) => 2022 + index); // Example range 2022 to 2031

  // Selected values
  String selectedMonth = 'January';
  int selectedDay = 1;
  int selectedYear = 2022;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Dropdown for Month
        DropdownButton<String>(
          value: selectedMonth,
          onChanged: (String? newValue) {
            setState(() {
              selectedMonth = newValue!;
            });
          },
          items: months.map<DropdownMenuItem<String>>((String month) {
            return DropdownMenuItem<String>(
              value: month,
              child: Text(month),
            );
          }).toList(),
        ),

        // Dropdown for Day
        DropdownButton<int>(
          value: selectedDay,
          onChanged: (int? newValue) {
            setState(() {
              selectedDay = newValue!;
            });
          },
          items: days.map<DropdownMenuItem<int>>((int day) {
            return DropdownMenuItem<int>(
              value: day,
              child: Text(day.toString()),
            );
          }).toList(),
        ),

        // Dropdown for Year
        DropdownButton<int>(

          value: selectedYear,
          onChanged: (int? newValue) {
            setState(() {
              selectedYear = newValue!;
            });
          },
          items: years.map<DropdownMenuItem<int>>((int year) {
            return DropdownMenuItem<int>(
              value: year,
              child: Text(year.toString()),
            );
          }).toList(),
        ),
      ],
    );
  }
}


