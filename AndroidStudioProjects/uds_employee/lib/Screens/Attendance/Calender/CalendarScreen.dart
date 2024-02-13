import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uds_employee/Allnavigations/AllNavigationsDirectory.dart';
import 'package:uds_employee/Allnavigations/AllimportedDirectory.dart';
import 'package:uds_employee/Bloc/PermissionBloc.dart';
import 'package:uds_employee/Screens/Attendance/cameraFile.dart';
import 'package:uds_employee/Utils/AppAlertController.dart';
import 'package:uds_employee/Utils/AppThemeManager.dart';

import '../../../Allnavigations/AllBlocDirectory.dart';
import '../../../Bloc/CalenderScreenBloc.dart';
import '../Leave/LeaveApply.dart';
import '../Permission/PermissionScreen.dart';

class CalenderScreen extends StatefulWidget {
  CalenderScreen(
      {Key? key, required this.value, this.leavedays, this.leaveType,this.selectedTypeId})
      : super(key: key);
  String value;
  String? leavedays;
  String? leaveType;
  String? selectedTypeId;

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  String _selectedDate = DateTime.now().toString();
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  TextEditingController _dutyController = TextEditingController();
  TextEditingController _permissionFromController = TextEditingController();
  TextEditingController _permissionToController = TextEditingController();
  List<GetCalenderData> calenderDataList = [];
  bool viweCalendar = false;
  int? changedmonth;
  int? changedYear;
  DateRangePickerController? _controller;
  DateTime? _initialDisplayDate;
  int count = 1;
  int dateofmONTH = DateTime.now().month;
  String userId = '';
  var formKeyCalender = GlobalKey<FormState>();
  String selectedValue1='AM';
  String selectedValue2="AM";
  final RegExp _timeRegExp = RegExp(r'^\d{2}\.\d{2}$');
  bool invalidTime = false;


  String selecedtDate(DateTime selectedDate) {
    int _date = selectedDate.day;

    return _date.toString();
  }

  String fromtime(String inputTime) {
    //tring inputTime = "10:00 AM";
    print("inputTime====");
    print(inputTime);
    DateTime initialTime = DateFormat("h.mm a").parse(inputTime);

    // Format the time to a different format
    String formattedTime = DateFormat("HH:mm").format(initialTime);

    return formattedTime;
  }

  String toTime(String outToTime) {
    DateTime initialTime = DateFormat("h.mm a").parse(outToTime);

    // Format the time to a different format
    String formattedTime = DateFormat("HH:mm").format(initialTime);

    return formattedTime;
    // DateTime outTime = DateFormat("h:mm a").parse(outToTime);
    // return outTime.toString();
  }

  @override
  void initState() {
    super.initState();
    selecteddate.clear();
    _selectedDate = DateTime.now().toString();
    _controller = DateRangePickerController();
    _initialDisplayDate = DateTime.now();
    getUserId();
  }

  String? validateTime(String? value) {
    if (value == null || value.isEmpty) {

      setState(() {
        invalidTime = false;
      });
      return 'Please enter a time';
    }

    if (!_timeRegExp.hasMatch(value)) {
     setState(() {
       invalidTime = true;
     });
      return 'Invalid time format. Use 00.00';
    }

    return null;
  }
  getUserId() async {
    print("get un");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('id')!;
    });
    print('userid');
    print(userId);
  }

  List<DateTime> selecteddate = [];
  List<DateTime> presentDates = [];

  List<DateTime> absentDates = [];
  List<DateTime> lossOfPayDates = [];
  List<DateTime> casualLeaveDates = [];
  List<DateTime> personalLeaveDates = [];
  List<String> absentDatesType = [];

  List<DateTime> weekOffDates = [];

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = args.value.startDate != null
            ? '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} - ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}'
            : '';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();

        selecteddate.clear();

        selecteddate.add(args.value);



        if (DateTime.now().toString().split(' ')[0] ==
            _selectedDate.toString().split(' ')[0]) {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => CameraScreen()));
        }
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
        selecteddate.clear();
        selecteddate.addAll(args.value);
        //   selecteddate.re
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return CalenderBloc()
            ..add(GetCalenderEvent(context, DateTime.now().year.toString(),
                DateTime.now().month.toString()));
        },
        child: BlocListener<CalenderBloc, CalenderState>(listener:
            (context, state) {
          if (state is GetCalenderSuccessState) {
            calenderDataList.clear();
            presentDates.clear();
            absentDates.clear();
            weekOffDates.clear();
            // absentDatesType.clear();
            lossOfPayDates.clear();
            personalLeaveDates.clear();
            for (int i = 0; i < state.data['data']['data'].length; i++) {
              calenderDataList
                  .add(GetCalenderData.fromJson(state.data['data']['data'][i]));
            }
            print(calenderDataList.length);
            for(int i = 0; i < calenderDataList.length; i++){
              print("${calenderDataList[i].attendanceType} calenderDataList");
            }

            for (int i = 0; i < calenderDataList.length; i++) {
              if (calenderDataList[i].present) {
                presentDates.add(calenderDataList[i].date);
              }

              if (calenderDataList[i].leave ) {
                print("calenderDataList[i].attendanceType");
                print(calenderDataList[i].attendanceType);
                if(calenderDataList[i].attendanceType=="Loss of pay"){

                  lossOfPayDates.add(calenderDataList[i].date);
                }
                if(calenderDataList[i].attendanceType=="Personal Leave"){
                  personalLeaveDates.add(calenderDataList[i].date);
                }
                if(calenderDataList[i].attendanceType=="Casual Leave"){
                  casualLeaveDates.add(calenderDataList[i].date);
                }

                if(calenderDataList[i].attendanceType!="Personal Leave" &&

                    calenderDataList[i].attendanceType!="Loss of pay"&&
                    calenderDataList[i].attendanceType!="Casual Leave")

                  // if(calenderDataList[i].attendanceType!="personal_leave" &&
                  //
                  //   calenderDataList[i].attendanceType!="loss_of_pay"&&
                  //   calenderDataList[i].attendanceType!="casual_leave")
                {
                  absentDates.add(calenderDataList[i].date);
                }
              }
              print("absentDates.length===");
              print(absentDates.length);
              print(presentDates.length);
              print(lossOfPayDates.length);
              print(personalLeaveDates.length);
              if (calenderDataList[i].weekoff) {
                weekOffDates.add(calenderDataList[i].date);
              }
            }

          }
        }, child:
            BlocBuilder<CalenderBloc, CalenderState>(builder: (context, state) {
          return

              // state is GetCalenderLoadingState
              //   ?
              // _buildShimmer(context)
              // :
              state is GetCalenderSuccessState
                  ? Scaffold(
                      backgroundColor: AppTheme.whiteColor,
                      appBar: AppBar(
                        elevation: 0,
                        backgroundColor: AppTheme.whiteColor,
                        automaticallyImplyLeading: false,
                        title: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CommonUI().myText(
                                text: 'CALENDER',
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                                letterSpacing: 0.2),
                          ],
                        ),
                      ),
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 95.w,
                                  height: 50.h,
                                  child: Card(
                                    elevation: 2,
                                    shadowColor: AppTheme.themeLightGrey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                            color: AppTheme.themeLightGrey,
                                            width: 0.1)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SfDateRangePicker(
                                        viewSpacing: 0.1,
                                        headerHeight: 40,
                                        controller: _controller,
                                        todayHighlightColor:
                                            AppTheme.todayColor,
                                        selectionShape:
                                            DateRangePickerSelectionShape
                                                .rectangle,
                                        selectionColor: AppTheme.todayColor,
                                        showNavigationArrow: true,
                                        allowViewNavigation: false,
                                        initialDisplayDate: _initialDisplayDate,

                                        onViewChanged:
                                            (DateRangePickerViewChangedArgs
                                                args) {
                                          viweCalendar = true;
                                          DateTime? visibleStartDate =
                                              args.visibleDateRange.startDate;
                                          DateTime? visibleEndDate =
                                              args.visibleDateRange.endDate;
                                          int month = visibleEndDate!.month;
                                          int year = visibleEndDate.year;
                                          changedYear = year;
                                          changedmonth = month;
                                          _initialDisplayDate =
                                              args.visibleDateRange.startDate!;

                                          if (dateofmONTH != month) {
                                            dateofmONTH =
                                                month; // Update the current month
                                            BlocProvider.of<CalenderBloc>(
                                                    context)
                                                .add(GetCalenderEvent(
                                                    context,
                                                    year.toString(),
                                                    month.toString()));
                                          }

                                          // if(DateTime.now().month !=month){
                                          //   dateofmONTH=month;
                                          //   if (dateofmONTH == month) {
                                          //     if(count==1){
                                          //       BlocProvider.of<CalenderBloc>(context)
                                          //           .add(GetCalenderEvent(context, year.toString(), month.toString()));
                                          //     }
                                          //
                                          //   }
                                          // }
                                          //
                                          // if (dateofmONTH != month) {
                                          //   BlocProvider.of<CalenderBloc>(context)
                                          //       .add(GetCalenderEvent(context, year.toString(), month.toString()));
                                          // }
                                        },

                                        headerStyle: DateRangePickerHeaderStyle(
                                            textAlign: TextAlign.center,
                                            textStyle: TextStyle(
                                                color: AppTheme.primaryColor2,
                                                fontSize: 15.sp)),
                                        // showActionButtons:true,

                                        onSelectionChanged: _onSelectionChanged,
                                        cellBuilder: _buildCellWidget,
                                        selectionMode: widget.value == "Leave"
                                            ? DateRangePickerSelectionMode
                                                .multiple
                                            : DateRangePickerSelectionMode
                                                .single,
                                        initialSelectedRange: PickerDateRange(
                                            DateTime.now().subtract(
                                                const Duration(days: 4)),
                                            DateTime.now()
                                                .add(const Duration(days: 3))),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Gap(2.h),
                            Padding(
                              padding: EdgeInsets.fromLTRB(3.h, 1.h, 1.h, 1.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppConstant.presentIcon,
                                    scale: 3,
                                  ),
                                  Gap(2.w),
                                  CommonUI()
                                      .myText(text: "Present", fontSize: 10.sp),
                                  Gap(4.w),
                                  Image.asset(
                                    AppConstant.absentIcon,
                                    scale: 3,
                                  ),
                                  Gap(2.w),
                                  CommonUI()
                                      .myText(text: "Absent", fontSize: 10.sp),
                                  Gap(4.w),
                                  Image.asset(
                                    AppConstant.weekOffIcon,
                                    scale: 3,
                                  ),
                                  Gap(2.w),
                                  Gap(2.w),
                                  CommonUI()
                                      .myText(text: "Week_off", fontSize: 10.sp)
                                ],
                              ),
                            ),
                            Gap(2.h),
                            // _buildCalender(),
                            widget.value == 'Calender'
                                ? _buildCalender()
                                : widget.value == 'Permission'
                                    ? _buildPermission()
                                    : widget.value == "Leave"
                                        ? _buildLeave(context)
                                        : _buildOnDuty(),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      color: AppTheme.whiteColor,
                      child: Image.asset(AppConstant.noDataIcon));
        })));
  }

  // Widget _buildoverAllCalendar(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) {
  //       return CalenderBloc()
  //         ..add(GetCalenderEvent(context, DateTime.now().year.toString(),
  //             DateTime.now().month.toString()));
  //     },
  //     child: BlocListener<CalenderBloc, CalenderState>(
  //       listener: (context, state) {
  //         if (state is GetCalenderSuccessState) {
  //           count = 2;
  //           calenderDataList.clear();
  //           for (int i = 0; i < state.data['data'].length; i++) {
  //             calenderDataList
  //                 .add(GetCalenderData.fromJson(state.data['data'][i]));
  //           }
  //           presentDates.clear();
  //           absentDates.clear();
  //           weekOffDates.clear();
  //           for (int i = 0; i < calenderDataList.length; i++) {
  //             if (calenderDataList[i].present) {
  //               presentDates.add(calenderDataList[i].date);
  //             }
  //             if (calenderDataList[i].leave) {
  //               absentDates.add(calenderDataList[i].date);
  //             }
  //             if (calenderDataList[i].weekoff) {
  //               weekOffDates.add(calenderDataList[i].date);
  //             }
  //           }
  //         }
  //       },
  //       child: BlocBuilder<CalenderBloc, CalenderState>(
  //         builder: (context, state) {
  //           Future.delayed(const Duration(seconds: 1), () {
  //             setState(() {});
  //           });
  //
  //           return state is GetCalenderSuccessState
  //               ? Center(
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: SizedBox(
  //                       width: 95.w,
  //                       height: 50.h,
  //                       child: Card(
  //                         elevation: 2,
  //                         shadowColor: AppTheme.themeLightGrey,
  //                         shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(5.0),
  //                             side: const BorderSide(
  //                                 color: AppTheme.themeLightGrey, width: 0.1)),
  //                         child: Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: SfDateRangePicker(
  //                             viewSpacing: 0.1,
  //                             headerHeight: 40,
  //                             controller: _controller,
  //                             todayHighlightColor: AppTheme.todayColor,
  //                             selectionShape:
  //                                 DateRangePickerSelectionShape.rectangle,
  //                             selectionColor: AppTheme.todayColor,
  //                             showNavigationArrow: true,
  //                             allowViewNavigation: false,
  //                             initialDisplayDate: _initialDisplayDate,
  //
  //                             onViewChanged:
  //                                 (DateRangePickerViewChangedArgs args) {
  //                               viweCalendar = true;
  //                               DateTime? visibleStartDate =
  //                                   args.visibleDateRange.startDate;
  //                               DateTime? visibleEndDate =
  //                                   args.visibleDateRange.endDate;
  //                               int month = visibleEndDate!.month;
  //                               int year = visibleEndDate.year;
  //                               changedYear = year;
  //                               changedmonth = month;
  //                               _initialDisplayDate =
  //                                   args.visibleDateRange.startDate!;
  //
  //                               if (dateofmONTH != month) {
  //                                 dateofmONTH =
  //                                     month; // Update the current month
  //                                 BlocProvider.of<CalenderBloc>(context).add(
  //                                     GetCalenderEvent(context, year.toString(),
  //                                         month.toString()));
  //                               }
  //                             },
  //
  //                             headerStyle: DateRangePickerHeaderStyle(
  //                                 textAlign: TextAlign.center,
  //                                 textStyle: TextStyle(
  //                                     color: AppTheme.primaryColor2,
  //                                     fontSize: 15.sp)),
  //                             // showActionButtons:true,
  //
  //                             onSelectionChanged: _onSelectionChanged,
  //                             cellBuilder: _buildCellWidget,
  //                             selectionMode: widget.value == "Leave"
  //                                 ? DateRangePickerSelectionMode.multiple
  //                                 : DateRangePickerSelectionMode.single,
  //                             initialSelectedRange: PickerDateRange(
  //                                 DateTime.now()
  //                                     .subtract(const Duration(days: 4)),
  //                                 DateTime.now().add(const Duration(days: 3))),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 )
  //               : Container(
  //                   color: AppTheme.whiteColor,
  //                   child: Image.asset(AppConstant.noDataIcon),
  //                 );
  //         },
  //       ),
  //     ),
  //   );
  // }

  Widget _buildCellWidget(
      BuildContext context, DateRangePickerCellDetails cellDetails) {
    bool isPresent = presentDates.contains(cellDetails.date);
    bool isAbsent = absentDates.contains(cellDetails.date);
    bool  isLOP = lossOfPayDates.contains(cellDetails.date);
    bool  isPersonalLeave = personalLeaveDates.contains(cellDetails.date);
    bool  isCasualLeave = casualLeaveDates.contains(cellDetails.date);


    bool isWeekOff = weekOffDates.contains(cellDetails.date);
    bool isSelected = selecteddate.contains(cellDetails.date);

    //bool isselected?
    if (isPresent) {
      return Stack(

          children:[
            Container(
              margin: EdgeInsets.all(3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppTheme.presentColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                cellDetails.date.day.toString(),
                style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily:AppThemeManager.defaultFontMetro),
              ),
            ),
            Positioned(
                right: 1.h,
                top: 1.h,
                child: CommonUI().myText(text: "P",fontSize: 8.sp))


          ]

      );
    }
    else if (isAbsent) {
      return Stack(
          children:[
            Container(
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppTheme.absentColor,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: Text(
                cellDetails.date.day.toString(),
                style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily:AppThemeManager.defaultFontMetro),
              ),
            ),
            Positioned(
                right: 1.h,
                top: 1.h,
                child: CommonUI().myText(text: "A",fontSize: 8.sp, color: Colors.green))
                // child: CommonUI().myText(text: "A",fontSize: 8.sp))

          ]

      );
    }

    else if (isLOP) {
      return Stack(
          children:[
            Container(
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppTheme.lopColor,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: Text(
                cellDetails.date.day.toString(),
                style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily:AppThemeManager.defaultFontMetro),
              ),
            ),
            Positioned(
                right: 1.h,
                top: 1.h,
                child: CommonUI().myText(text: "LOP",fontSize: 8.sp, color: Colors.black))
                // child: CommonUI().myText(text: "A",fontSize: 8.sp))

          ]

      );
    }

    else if (isPersonalLeave) {
      return Stack(
          children:[
            Container(
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppTheme.personalLeaveColor,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: Text(
                cellDetails.date.day.toString(),
                style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily:AppThemeManager.defaultFontMetro),
              ),
            ),
            Positioned(
                right: 1.h,
                top: 1.h,
                child: CommonUI().myText(text: "PL",fontSize: 8.sp, color: Colors.black))
                // child: CommonUI().myText(text: "A",fontSize: 8.sp))

          ]

      );
    }
    else if (isCasualLeave) {
      return Stack(
          children:[
            Container(
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppTheme.casualLeaveColor,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: Text(
                cellDetails.date.day.toString(),
                style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily:AppThemeManager.defaultFontMetro),
              ),
            ),
            Positioned(
                right: 1.h,
                top: 1.h,
                child: CommonUI().myText(text: "CL",fontSize: 8.sp, color: Colors.black))
                // child: CommonUI().myText(text: "A",fontSize: 8.sp))

          ]

      );
    }

    else if (isWeekOff) {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppTheme.weekOffColor,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Text(
              cellDetails.date.day.toString(),
              style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily:AppThemeManager.defaultFontMetro),
            ),
          ),

          Positioned(
              right: 1.h,
              top: 1.h,
              child: CommonUI().myText(text: "W",fontSize: 8.sp))

        ],

      );
    } else {
      // Default styling for other dates
      return Container(
        margin: const EdgeInsets.all(3),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.todayColor : AppTheme.calendarColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          cellDetails.date.day.toString(),
          style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily:AppThemeManager.defaultFontMetro ),
        ),
      );
    }
  }

  Widget _buildCalender() {
    return Container(
      height: 35.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: AppTheme.attendanceColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(2.h),
            CommonUI().myText(
                text: "Working Attendance",
                fontSize: 15.sp,
                fontWeight: FontWeight.w600),
            Gap(1.h),
            CommonUI().myText(
                text: "Current Month Working Attendance Report",
                fontSize: 10.sp,
                color: AppTheme.attendanceTextColor),
            Gap(4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonUI().myText(
                    text: "Present Days of Month ",
                    fontWeight: FontWeight.w500),
                Spacer(),
                CommonUI().myText(
                    text: presentDates.length.toString(),
                    color: AppTheme.primaryColor1,
                    fontWeight: FontWeight.w600),
                Gap(4.w),
              ],
            ),
            Gap(2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonUI()
                    .myText(text: "Absentees", fontWeight: FontWeight.w500),
                Spacer(),
                CommonUI().myText(
                    text: absentDates.length.toString(),
                    color: AppTheme.primaryColor1,
                    fontWeight: FontWeight.w600),
                Gap(4.w),
              ],
            ),
            Gap(2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonUI()
                    .myText(text: "Week off ", fontWeight: FontWeight.w500),
                Spacer(),
                CommonUI().myText(
                    text: weekOffDates.length.toString(),
                    color: AppTheme.primaryColor1,
                    fontWeight: FontWeight.w600),
                Gap(4.w),
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  Widget _buildOnDuty() {
    return Container(
      height: 40.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: AppTheme.attendanceColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(2.h),
            Row(
              children: [
                Image.asset(
                  AppConstant.dateIcon,
                  scale: 2,
                ),
                Gap(3.w),
                CommonUI().myText(text: '${DateTime.parse(_selectedDate).day.toString()}th ${getMonthName(DateTime.parse(_selectedDate).month)} ${DateTime.parse(_selectedDate).year.toString()}'),
              ],
            ),
            Gap(2.h),
            Row(
              children: [
                Image.asset(
                  AppConstant.timerIcon,
                  scale: 3,
                ),
                Gap(3.w),
                CommonUI().myText(text: 'Shift Timing'),
                Gap(1.w),
                CommonUI().myText(
                    text: '8.00am to 4.00pm', color: AppTheme.primaryColor2),
              ],
            ),
            Gap(4.h),
            CommonUI().myText(text: "Purpose", fontSize: 12.sp),
            Card(
              color: AppTheme.whiteColor,
              child: SizedBox(
                child: CommonUI.textAreaFormField(
                    maxLines: 5,
                    editingController: _dutyController,
                    hinttext: ''),
              ),
            ),
            Gap(2.h),
            Center(
              child: CommonUI.buttonContainer(
                  gradientsecond: AppTheme.buttonColor,
                  gradientfirst: AppTheme.buttonColor,
                  height: 4.h,
                  width: 80.w,
                  onPressed: () {},
                  file: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonUI().myText(
                          text: "REQUEST ON DUTY",
                          color: AppTheme.whiteColor,
                          fontSize: 10.sp),
                      Gap(2.h),
                      Image.asset(
                        AppConstant.frontarrowIcon,
                        scale: 3,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPermission() {
    return BlocProvider(
      create: (context) {
        var bloc = PermissionBloc();
        // bloc.add(PermissionApplyEvent(context, payload))

        return bloc;
      },
      child: BlocListener<PermissionBloc, PermissionState>(
        listener: (context, state) {
          if (state is PermissionApplySuccessState) {
            print(state);
            print(state.data);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PermissionScreen(userID: userId)));
          }
        },
        child: BlocBuilder<PermissionBloc, PermissionState>(
          builder: (context, state) {
            return Container(
              //height: 40.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: AppTheme.attendanceColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKeyCalender,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(2.h),
                      Row(
                        children: [
                          Image.asset(
                            AppConstant.dateIcon,
                            scale: 2,
                          ),
                          Gap(3.w),
                          CommonUI().myText(
                              text:
                                  '${DateTime.parse(_selectedDate).day.toString()} th ${getMonthName(DateTime.parse(_selectedDate).month)} ${DateTime.parse(_selectedDate).year.toString()}'),
                        ],
                      ),
                      Gap(2.h),
                      CommonUI().myText(text: "PERMISSION"),
                      Gap(2.h),
                      Row(
                        children: [
                          CommonUI().myText(text: "Timing", fontSize: 10.sp),
                          invalidTime ?   CommonUI().myText(text: "  (00.00)",
                              color: AppTheme.primaryColor1,
                              fontSize: 10.sp) : SizedBox(),
                        ],
                      ),
                      Gap(2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width: 25.w,
                                  child: CommonUI.textAreaFormField(
                                      editingController: _permissionFromController,
                                      hinttext: "00.00",
                                      maxLength: 5,
                                      // keyboardType: TextInputType.text,
                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          _timeRegExp,
                                        ),
                                      ],
                                      validator:  validateTime
                                      //     (value) {
                                      //   if (value!.isNotEmpty) {
                                      //     return null;
                                      //   } else {
                                      //     return "Please enter your time";
                                      //   }
                                      // }
                                      )),
                              DropdownButton<String>(
                                value: selectedValue1,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue1 = newValue!;
                                  });
                                },
                                items: <String>['AM', 'PM']
                                    .map<DropdownMenuItem<String>>(
                                      (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: SizedBox(
                                        width:8.w,child:CommonUI().myText(text: value)),
                                  ),
                                )
                                    .toList(),
                              ),
                            ],
                          ),
                          Gap(1.h),
                          CommonUI().myText(text: "TO"),
                          Gap(1.h),
                          Row(
                            children: [
                              SizedBox(
                                  width: 25.w,
                                  child: CommonUI.textAreaFormField(
                                      editingController: _permissionToController,
                                      hinttext: "00.00",
                                      maxLength: 5,
                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          _timeRegExp,
                                        ),
                                      ],
                                      validator: validateTime,
                                      //     (value) {
                                      //   if (value!.isNotEmpty) {
                                      //     return null;
                                      //   } else {
                                      //     return "Please enter your time";
                                      //   }
                                      // }
                                      )),
                  DropdownButton<String>(
                    value: selectedValue2,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue2 = newValue!;
                      });
                    },
                    items: <String>['AM', 'PM']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                        .toList(),
                  ),
                            ],
                          )
                        ],
                      ),
                      Gap(4.h),
                      CommonUI().myText(text: "Note", fontSize: 12.sp),
                      Card(
                        color: AppTheme.whiteColor,
                        child: SizedBox(
                          child: CommonUI.textAreaFormField(
                              maxLines: 5,
                              editingController: _dutyController,
                              hinttext: '',
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return " Please enter notes";
                                }
                              }),
                        ),
                      ),
                      Gap(2.h),
                      Center(
                        child: CommonUI.buttonContainer(
                            gradientsecond: AppTheme.buttonColor,
                            gradientfirst: AppTheme.buttonColor,
                            height: 4.h,
                            width: 80.w,
                            onPressed: () {
                              var form = formKeyCalender.currentState;

                              if (form?.validate() ?? true) {
                                if (DateTime.parse(_selectedDate)
                                        .isAfter(DateTime.now()) ||
                                    DateTime.parse(_selectedDate)
                                            .toString()
                                            .split(' ')[0] ==
                                        DateTime.now()
                                            .toString()
                                            .split(' ')[0]) {
                                  var payload = PermissionApply(
                                      fromTime: fromtime(
                                          '${_permissionFromController.text} $selectedValue1'),
                                      toTime:
                                          toTime('${_permissionToController.text} $selectedValue2'),
                                      notes: _dutyController.text,
                                      userId: userId,
                                      fromdate: _selectedDate.split(' ')[0]);
                                  BlocProvider.of<PermissionBloc>(context).add(
                                      PermissionApplyEvent(context, payload));
                                } else {
                                  ToastContext().init(context);
                                  Toast.show(
                                      "Please Select current or Future Date",
                                      backgroundColor: AppTheme.primaryColor2,
                                      duration: Toast.lengthLong,
                                      gravity: Toast.bottom);
                                }
                              }
                            },
                            file: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonUI().myText(
                                    text: "REQUEST PERMISSION",
                                    color: AppTheme.whiteColor,
                                    fontSize: 10.sp),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLeave(BuildContext context) {
    return Container(
        //height: 40.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: AppTheme.attendanceColor.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: selecteddate.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppConstant.dateIcon,
                                scale: 3,
                              ),
                              Gap(2.h),
                              CommonUI().myText(
                                  text:
                                      " ${selecteddate[index].day} th November 2023"),
                            ],
                          ),
                          Gap(2.h),
                          const Divider(
                            color: AppTheme.themeDarkGrey,
                          )
                        ],
                      ),
                    );
                  }),
              CommonUI.buttonContainer(
                  height: 4.h,
                  width: 90.w,
                  gradientfirst: AppTheme.primaryColor2,
                  gradientsecond: AppTheme.primaryColor2,
                  onPressed: () {
                    selecteddate.isNotEmpty
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LeaveApplyScreen(
                                      date: selecteddate,
                                      leaveType: widget.leaveType,
                                      userId: userId,
                                  leaveTypeId: widget.selectedTypeId,

                                    )))
                        : SizedBox();
                  },
                  file: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonUI().myText(
                          text: "SELECT DATE",
                          color: AppTheme.whiteColor,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w600),
                      Gap(2.h),
                      Image.asset(
                        AppConstant.frontarrowIcon,
                        scale: 3,
                      )
                    ],
                  ))
            ],
          ),
        ));
  }

  Widget _buildShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: (Colors.grey)!,
      highlightColor: (Colors.grey)!,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5, // Number of shimmering items
        itemBuilder: (context, index) {
          return Material(
            type: MaterialType.card,
            color: AppTheme.whiteColor,
            child: ListTile(
              title: Container(
                width: double.infinity,
                height: 15.h,
                color: Colors.white, // Placeholder color
              ),
            ),
          );
        },
      ),
    );
  }

  String getMonthName(int monthValue) {
    switch (monthValue) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return "December";

      default:
        return 'Unknown Month';
    }
  }
}
