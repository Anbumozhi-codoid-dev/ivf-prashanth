import 'package:flutter/material.dart';
import 'package:ivf/Utils/AllImports.dart';

import 'AppTheme.dart';

class DateDropdownsRow extends StatefulWidget {
  DateDropdownsRow({
    required this.showDay,
    required this.onDateChanged, // Add the callback parameter
  });

  bool showDay;
  final void Function(int day, String month, int year) onDateChanged; // Define the callback type

  @override
  _DateDropdownsRowState createState() => _DateDropdownsRowState();
}

class _DateDropdownsRowState extends State<DateDropdownsRow> {
  // Lists for dropdown items
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List<int> days = List<int>.generate(31, (index) => index + 1);

  List<int> years = List<int>.generate(DateTime.now().year - 1900 + 1, (index) => 1900 + index);

  // Selected values
  String selectedMonth = 'January';
  int selectedDay = 1;
  int selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    bool isTablet = isTabletDevice(context); // Use the utility function

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Dropdown for Month
        Container(
          width: 32.w,
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppTheme.formFieldGrey,
          ),
          child: DropdownButtonFormField<String>(
            icon: isTablet
                ? Column(
              children: [
                Gap(1.h),
                Image.asset(
                  AppConstants.dropdownIcon,
                  scale: isTablet ? 1.5 : 4,
                ),
              ],
            )
                : Image.asset(
              AppConstants.dropdownIcon,
              scale: 4,
            ),
            value: selectedMonth,
            onChanged: (String? newValue) {
              setState(() {
                selectedMonth = newValue!;
                widget.onDateChanged(selectedDay, selectedMonth, selectedYear); // Call the callback
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              filled: true,
              fillColor: AppTheme.formFieldGrey,
            ),
            dropdownColor: Colors.white,
            items: months.map<DropdownMenuItem<String>>((String month) {
              return DropdownMenuItem<String>(
                alignment: Alignment.center,
                value: month,
                child: Column(
                  children: [
                    Center(
                      child: CommonUI().myText(
                          text: month,
                          color: AppTheme.FontGrey,
                          fontSize: 12.5.sp,
                          fontfamily: "Nunito"),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),

        Gap(1.w),
        // Dropdown for Day
        widget.showDay
            ? Container(
          width: 20.w,
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppTheme.formFieldGrey,
          ),
          child: DropdownButtonFormField<int>(
            icon: isTablet
                ? Column(
              children: [
                Gap(1.h),
                Image.asset(
                  AppConstants.dropdownIcon,
                  scale: isTablet ? 1.5 : 4,
                ),
              ],
            )
                : Image.asset(
              AppConstants.dropdownIcon,
              scale: 4,
            ),
            value: selectedDay,
            onChanged: (int? newValue) {
              setState(() {
                selectedDay = newValue!;
                widget.onDateChanged(selectedDay, selectedMonth, selectedYear); // Call the callback
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              filled: true,
              fillColor: AppTheme.formFieldGrey,
            ),
            dropdownColor: Colors.white,
            items: days.map<DropdownMenuItem<int>>((int day) {
              return DropdownMenuItem<int>(
                alignment: Alignment.center,
                value: day,
                child: Column(
                  children: [
                    CommonUI().myText(
                        text: day.toString(),
                        color: AppTheme.FontGrey,
                        fontSize: 12.5.sp,
                        fontfamily: "Nunito"),
                  ],
                ),
              );
            }).toList(),
          ),
        )
            : SizedBox(),
        widget.showDay ? Gap(1.w) : SizedBox(),

        // Dropdown for Year
        Container(
          width: 25.w,
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppTheme.formFieldGrey,
          ),
          child: DropdownButtonFormField<int>(
            icon: isTablet
                ? Column(
              children: [
                Gap(1.h),
                Image.asset(
                  AppConstants.dropdownIcon,
                  scale: isTablet ? 1.5 : 4,
                ),
              ],
            )
                : Image.asset(
              AppConstants.dropdownIcon,
              scale: 4,
            ),
            value: selectedYear,
            onChanged: (int? newValue) {
              setState(() {
                selectedYear = newValue!;
                widget.onDateChanged(selectedDay, selectedMonth, selectedYear); // Call the callback
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              filled: true,
              fillColor: AppTheme.formFieldGrey,
            ),
            dropdownColor: AppTheme.formFieldGrey,
            items: years.map<DropdownMenuItem<int>>((int year) {
              return DropdownMenuItem<int>(
                alignment: Alignment.center,
                value: year,
                child: Column(
                  children: [
                    CommonUI().myText(
                        text: year.toString(),
                        color: AppTheme.FontGrey,
                        fontSize: 12.5.sp,
                        fontfamily: "Nunito"),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        !widget.showDay ? Gap(13.w) : SizedBox()
      ],
    );
  }
}


// class DateDropdownsRow extends StatefulWidget {
//   DateDropdownsRow({
//     required this.showDay
// });
//   bool showDay;
//   //
//   // HowFeelingPage({super.key, required this.firstname});
//   // String firstname;
//   @override
//   _DateDropdownsRowState createState() => _DateDropdownsRowState();
// }
//
// class _DateDropdownsRowState extends State<DateDropdownsRow> {
//   // Lists for dropdown items
//   List<String> months = [
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December'
//   ];
//
//   List<int> days = List<int>.generate(31, (index) => index + 1);
//
//   // List<int> years = List<int>.generate(
//   //     10, (index) => 2022 + index); // Example range 2022 to 2031
//
//   // int currentYear = DateTime.now().year;
//   List<int> years = List<int>.generate(DateTime.now().year - 1900 + 1, (index) => 1900 + index);
//
//
//   // Selected values
//   String selectedMonth = 'January';
//   int selectedDay = 1;
//   int selectedYear = 2022;
//
//   @override
//   Widget build(BuildContext context) {
//     bool isTablet = isTabletDevice(context); // Use the utility function
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         // Dropdown for Month
//         Container(
//           width: 32.w,
//           height: 6.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             // color: Colors.blue,
//             color: AppTheme.formFieldGrey,
//           ),
//           child: DropdownButtonFormField<String>(
//             // itemHeight: 9.h,
//             // menuMaxHeight: 100.h,
//             icon: isTablet ?
//             Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//
//               children: [
//                 Gap(1.h),
//                 Image.asset(
//                   AppConstants.dropdownIcon,
//                   scale:  isTablet ? 1.5 : 4,
//                 ),
//               ],
//             )
//             :
//             Image.asset(
//               AppConstants.dropdownIcon,
//               scale: 4,
//             ),
//             value: selectedMonth,
//             onChanged: (String? newValue) {
//               setState(() {
//                 selectedMonth = newValue!;
//               });
//             },
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(horizontal: 10),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: Colors.transparent),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: Colors.transparent),
//               ),
//               filled: true,
//               fillColor: AppTheme.formFieldGrey,
//             ),
//             dropdownColor: Colors.white, // Dropdown menu background color
//             items: months.map<DropdownMenuItem<String>>((String month) {
//               return DropdownMenuItem<String>(
//                 alignment: Alignment.center,
//                 value: month,
//                 child:
//                 Column(
//                   children: [
//                     Center(
//                       child: CommonUI().myText(
//                           text: month,
//                           color: AppTheme.FontGrey,
//                           // fontSize: 14.sp,
//                           fontSize: 12.5.sp,
//                           fontfamily: "Nunito"),
//                     ),
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//
//         Gap(1.w),
//         // Dropdown for Day
//      widget.showDay ?
//      Container(
//           width: 20.w,
//           height: 6.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: AppTheme.formFieldGrey,
//           ),
//           child: DropdownButtonFormField<int>(
//             // itemHeight: 5.h,
//             icon: isTablet ?
//             Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//
//               children: [
//                 Gap(1.h),
//                 Image.asset(
//                   AppConstants.dropdownIcon,
//                   scale:  isTablet ? 1.5 : 4,
//                 ),
//               ],
//             )
//                 :
//             Image.asset(
//               AppConstants.dropdownIcon,
//               scale: 4,
//             ),
//             value: selectedDay,
//             onChanged: (int? newValue) {
//               setState(() {
//                 selectedDay = newValue!;
//               });
//             },
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(horizontal: 10),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: Colors.transparent),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: Colors.transparent),
//               ),
//               filled: true,
//               fillColor: AppTheme.formFieldGrey,
//               // fillColor: AppTheme.formFieldGrey,
//               // fillColor: Colors.pink,
//             ),
//             dropdownColor: Colors.white, // Dropdown menu background color
//             items: days.map<DropdownMenuItem<int>>((int day) {
//               return DropdownMenuItem<int>(
//                 alignment: Alignment.center,
//                 value: day,
//                 child:  Column(
//                   children: [
//                     CommonUI().myText(
//                         text: day.toString(),
//                         color: AppTheme.FontGrey,
//                         fontSize: 12.5.sp,
//                         fontfamily: "Nunito"),
//                     // Gap(1.h)
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
//         )
//         :
//         SizedBox(),
//         widget.showDay ?   Gap(1.w) : SizedBox(),
//
//         // Dropdown for Year
//         Container(
//           width: 25.w,
//           height: 6.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: AppTheme.formFieldGrey,
//           ),
//           child: DropdownButtonFormField<int>(
//             // itemHeight: 9.h,
//             icon: isTablet ?
//             Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//
//               children: [
//                 Gap(1.h),
//                 Image.asset(
//                   AppConstants.dropdownIcon,
//                   scale:  isTablet ? 1.5 : 4,
//                 ),
//               ],
//             )
//                 :
//             Image.asset(
//               AppConstants.dropdownIcon,
//               scale: 4,
//             ),
//             value: selectedYear,
//             onChanged: (int? newValue) {
//               setState(() {
//                 selectedYear = newValue!;
//               });
//             },
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(horizontal: 10),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: Colors.transparent),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: Colors.transparent),
//               ),
//               filled: true,
//               fillColor: AppTheme.formFieldGrey,
//               // fillColor: Colors.grey.withOpacity(0.1),
//             ),
//             dropdownColor:
//                 AppTheme.formFieldGrey, // Dropdown menu background color
//             items: years.map<DropdownMenuItem<int>>((int year) {
//               return DropdownMenuItem<int>(
//                 alignment: Alignment.center,
//                 value: year,
//                 child:  Column(
//                   children: [
//                     CommonUI().myText(
//                         text: year.toString(),
//                         color: AppTheme.FontGrey,
//                         fontSize: 12.5.sp,
//                         fontfamily: "Nunito"),
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//         !widget.showDay ?  Gap(13.w) : SizedBox()
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:ivf/Utils/AllImports.dart';
//
// import 'AppTheme.dart';
//
// class DateDropdownsRow extends StatefulWidget {
//   @override
//   _DateDropdownsRowState createState() => _DateDropdownsRowState();
// }
//
// class _DateDropdownsRowState extends State<DateDropdownsRow> {
//   // Lists for dropdown items
//   List<String> months = [
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December'
//   ];
//
//   List<int> days = List<int>.generate(31, (index) => index + 1);
//
//   List<int> years = List<int>.generate(
//       10, (index) => 2022 + index); // Example range 2022 to 2031
//
//   // Selected values
//   String selectedMonth = 'January';
//   int selectedDay = 1;
//   int selectedYear = 2022;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // selectedMonth = "MM";
//     // selectedDay = int.parse("DD");
//     // selectedYear= int.parse("YYYY");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // Dropdown for Month
//         Container(
//           width: 30.w,
//           height: 6.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: AppTheme.formFieldGrey,
//           ),
//           child: DropdownButton<String>(
//             hint:  CommonUI().myText(
//                 text: "MM",
//                 color: AppTheme.FontGrey,
//                 fontSize: 14.sp,
//                 fontfamily: "Nunito"),
//             icon: Image.asset(
//               AppConstants.dropdownIcon,
//               scale: 2.9,
//             ),
//             underline: SizedBox(),
//             value: selectedMonth,
//             onChanged: (String? newValue) {
//               setState(() {
//                 selectedMonth = newValue!;
//               });
//             },
//             items: months.map<DropdownMenuItem<String>>((String month) {
//               return DropdownMenuItem<String>(
//                   value: month,
//                   child: Row(
//                     children: [
//                       Gap(1.5.w),
//                       CommonUI().myText(
//                           text: month,
//                           color: AppTheme.FontGrey,
//                           fontSize: 12.sp,
//                           fontfamily: "Nunito"),
//                     ],
//                   )
//
//                   // Text(month),
//                   );
//             }).toList(),
//           ),
//         ),
//
//         // Dropdown for Day
//         Container(
//           width: 20.w,
//           height: 6.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: AppTheme.formFieldGrey,
//           ),
//           child: DropdownButton<int>(
//             icon: Image.asset(
//               AppConstants.dropdownIcon,
//               scale: 2.9,
//             ),
//             underline: SizedBox(),
//             value: selectedDay,
//             onChanged: (int? newValue) {
//               setState(() {
//                 selectedDay = newValue!;
//               });
//             },
//             items: days.map<DropdownMenuItem<int>>((int day) {
//               return DropdownMenuItem<int>(
//                   value: day,
//                   child: Row(
//                     children: [
//                       Gap(2.w),
//                       CommonUI().myText(
//                           text: day.toString(),
//                           color: AppTheme.FontGrey,
//                           fontSize: 12.sp,
//                           fontfamily: "Nunito"),
//                       Gap(3.w)
//                     ],
//                   ));
//             }).toList(),
//           ),
//         ),
//
//         // Dropdown for Year
//         Container(
//           width: 30.w,
//           height: 6.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: AppTheme.formFieldGrey,
//           ),
//           child: DropdownButton<int>(
//             icon: Image.asset(
//               AppConstants.dropdownIcon,
//               scale: 2.9,
//             ),
//             // Icon(Icons.arrow_drop_down_sharp, color: AppTheme.themePink,
//             // size: 33.sp,),
//             value: selectedYear,
//             onChanged: (int? newValue) {
//               setState(() {
//                 selectedYear = newValue!;
//               });
//             },
//             items: years.map<DropdownMenuItem<int>>((int year) {
//               return DropdownMenuItem<int>(
//                   value: year,
//                   child: Row(
//                     children: [
//                       Gap(3.w),
//                       CommonUI().myText(
//                           text: year.toString(),
//                           color: AppTheme.FontGrey,
//                           fontSize: 12.sp,
//                           fontfamily: "Nunito"),
//                       Gap(6.w)
//                     ],
//                   )
//                   // Text(year.toString()),
//                   );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }
