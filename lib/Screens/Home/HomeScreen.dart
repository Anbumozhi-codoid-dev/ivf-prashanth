import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Utils/AllImports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  bool _isSearching = false;
  bool isVideo = false;
  int? _current;




  List<String> imageList = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    // 'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
      ];

  int currentIndex = 0;
  void _onClear() {
    _controller.clear();
    setState(() {
      _isSearching = false;
    });
  }

  bool daySelected = false;
 String?  selectedIndex;
  String? selectedDay;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _current = 0;
    print("selectedDay-0-0-01");
    print(DateTime.now().day.toString());
    setState(() {
      selectedDay = DateTime.now().day.toString();

    });
    print("selectedDay-0-0-0");
    print(selectedDay);
  }
  @override
  Widget build(BuildContext context) {


    DateTime now = DateTime.now();
    int currentYear = now.year;
    int currentMonth = now.month;
    int currentday = now.day;
    print("currentday===");
    print(currentday);
    print(selectedDay);

    // Calculate the number of days in the current month


    List<DateTime> dates = [];
    DateTime currentDate = DateTime.now();
    DateTime firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    int daysInMonth = DateTime(currentDate.year, currentDate.month + 1, 0).day;
    print("daysInMonth");
    print(daysInMonth);
    print("currentDate.day---");
    print(DateTime.now());

    // Generate dates for the next 7 days
    // Generate dates starting from today until the end of the month
    for (int i = currentDate.day +1; i < daysInMonth; i++) {
    // for (int i = currentDate.day - 1; i < daysInMonth; i++) {
      dates.add(firstDayOfMonth.add(Duration(days: i)));
    }
    print("dates.length-");
    print(dates.length);
    return Scaffold(
      backgroundColor: AppTheme.dashboardBG,
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.blue,
          height: 360.h,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Stack(
               children: [
                 Container(
                   height: 37.h,
                   width: 100.w,
                   // color: Colors.blue,
                 ),

                 Positioned(
                   top: 11.h,

                   child:
                   Padding(
                     padding:  EdgeInsets.fromLTRB(2.w,0,0,0),
                     child: Container(
                       height: 32.h,
                       width: 95.w,
                       // color: Colors.yellow,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(

                           bottomRight: Radius.circular(10),
                           bottomLeft: Radius.circular(10)
                         ),
                         // color: Colors.yellow,

                         color: AppTheme.white
                       ),
                       child: Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Padding(
                                 padding:  EdgeInsets.fromLTRB(2.w,0.h,0,0),
                                 child: Container(
                                   height: 20.h,
                                   width: 40.w,
                                   // color: Colors.grey,

                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Container(
                                         width: 100.w,
                                         child: CommonUI().myText(text: "Track your Menstruation and Treatment",
                                         fontSize: 10.2.sp,
                                           maxLines: 3,
                                           overflow: TextOverflow.visible,
                                             fontWeight: FontWeight.w600
                                         ),
                                       ),
                                       Gap(2.h),
                                       Row(

                                         children: [
                                           Image.asset(AppConstants.pinkTick, scale: 3,),
                                           Gap(3.w),
                                           CommonUI().myText(text: "Periods Tracking",
                                           fontWeight: FontWeight.w400,
                                             fontSize: 10.sp,
                                             color: AppTheme.fontGrey
                                           ),
                                         ],
                                       ),
                                       Gap(1.h),
                                       Row(
                                         children: [
                                           Image.asset(AppConstants.pinkTick, scale: 3,),
                                           Gap(3.w),
                                           CommonUI().myText(text: "Treatment Tracking",
                                           fontWeight: FontWeight.w400,
                                             fontSize: 10.sp,
                                               color: AppTheme.fontGrey
                                           ),
                                         ],
                                       ),
                                       Gap(1.h),
                                       Row(
                                         children: [
                                           Image.asset(AppConstants.pinkTick, scale: 3,),
                                           Gap(3.w),
                                           CommonUI().myText(text: "Health Monitoring",
                                           fontWeight: FontWeight.w400,
                                             fontSize: 10.sp,
                                               color: AppTheme.fontGrey
                                           ),
                                         ],
                                       ),
                                       // Gap(0.2.h),
                                       CommonUI().buttonContainer(
                                           color: AppTheme.themePink,
                                           height: 3.4.h,
                                           width: 30.w,
                                         child: Center(
                                           child: CommonUI().myText(text: "Start Tracking",
                                           color: AppTheme.white,
                                             fontSize: 10.sp,
                                             fontWeight: FontWeight.w700
                                           ),
                                         )
                                       )
                                     ],
                                   ),
                                 ),
                               ),
                               Padding(
                                 padding:  EdgeInsets.fromLTRB(2.w,2.h,0,0),
                                 child: Container(

                                     height: 30.h,
                                     width: 40.w,
                                     // color: Colors.grey,

                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Gap(3.h),
                                         Image.asset(AppConstants.calendarImage, scale: 4,),
                                       ],
                                     )
                                 ),
                               ),
                               Gap(5.w)
                             ],
                           ),

                         ],
                       ),
                     ),
                   ),
                 ),
                 Positioned(
                   top: 4.h,
                   child: Padding(
                     padding:  EdgeInsets.fromLTRB(2.w,0,0,0),
                     child: Container(
                       height: 7.h,
                       width: 25.w,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(
                           topRight: Radius.circular(20),
                           topLeft: Radius.circular(20)
                         )

                       ),
                       child: Center(
                         child: CommonUI().myText(text: "Today",
                         color: AppTheme.textPink,
                           fontWeight: FontWeight.w600,
                           fontSize: 14.sp
                         ),
                       ),
                     ),
                   ),
                 ),
                 Positioned(
                   left: 25.w,
                   top: 4.h,
                   child: Container(
                     width: 80.w,
                     height: 7.h,
                     color: Colors.transparent,
                     child:
                     ListView.builder(
                                       scrollDirection: Axis.horizontal,
                                       itemCount: 5,
                                       // itemCount: dates.length,
                                       shrinkWrap: true,
                                       physics: NeverScrollableScrollPhysics(),
                                       itemBuilder: (context, index) {
                                         // Format day as two digits (e.g., 01, 02, ..., 31)
                                         String day = dates[index].day
                                             .toString().padLeft(2, '0');

                                         return GestureDetector(
                                           onTap: () {
                                             setState(() {
                                               selectedIndex = index.toString();

                                               daySelected = !daySelected;
                                               print("iontapper");
                                               print(daySelected);
                                               selectedDay = day;
                                               print("selectedDay--");
                                               print(selectedDay);
                                             });
                                           },
                                           child: Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child:
                                             daySelected && index.toString() ==
                                                 selectedIndex &&
                                                 "0$currentday".toString() !=
                                                     selectedDay

                                                 ?
                                             CircleAvatar(
                                               radius: 30,
                                               backgroundColor: AppTheme
                                                   .themePink,
                                               // Customize background color
                                               child: Text(
                                                 day,
                                                 style: TextStyle(
                                                     color: AppTheme.white),
                                               ),
                                             )
                                                 :
                                             CircleAvatar(
                                               radius: 30,
                                               backgroundColor: AppTheme.white,
                                               // Customize background color
                                               child: Text(
                                                 day,
                                                 style: TextStyle(
                                                     color: Colors.black),
                                               ),
                                             )

                                             ,
                                           ),
                                         );
                                       }
                                             )
                   ),

                 )
               ],
             ),

             // Padding(
             //   padding:  EdgeInsets.fromLTRB(3.w,4.h,3.w,0),
             //   child: Stack(
             //
             //     children:[
             //
             //      Column(
             //       children: [
             //         Stack(
             //           children:[
             //             Container(
             //             height: 10.h,
             //             child: SizedBox(
             //               height: selectedDay == currentday.toString() ?  10.h : 20.h, // Adjust the height according to your needs
             //               child: ListView.builder(
             //                 scrollDirection: Axis.horizontal,
             //                 itemCount: dates.length,
             //                 itemBuilder: (context, index) {
             //                   // Format day as two digits (e.g., 01, 02, ..., 31)
             //                   String day = dates[index].day.toString().padLeft(2, '0');
             //
             //                   return GestureDetector(
             //                     onTap: (){
             //                       setState(() {
             //
             //                         selectedIndex = index.toString();
             //
             //                         daySelected = !daySelected;
             //                         print("iontapper");
             //                         print(daySelected);
             //                         selectedDay = day;
             //                         print("selectedDay--");
             //                         print(selectedDay);
             //                       });
             //                     },
             //                     child: Padding(
             //                       padding: const EdgeInsets.all(8.0),
             //                       child:
             //                       // currentday.toString() == selectedDay && currentday.toString() == day ?
             //                       // daySelected && index.toString() == selectedIndex &&  "0$currentday".toString() == selectedDay
             //                    "0$currentday".toString() == day
             //                           ?
             //
             //                       Container(
             //                         // height: 2.h,
             //                         width: 23.w,
             //                         decoration: BoxDecoration(
             //                             borderRadius: BorderRadius.only(
             //                               topLeft: Radius.circular(20),
             //                               topRight: Radius.circular(20)
             //                             ),
             //                             color: AppTheme.white
             //                           // color: Colors.blue
             //                         ),
             //                         child: Center(
             //                           child:
             //                             CommonUI().myText(text: "Today",
             //                             color: AppTheme.textPink,
             //                               fontSize: 14.sp,
             //                               fontWeight: FontWeight.w600
             //                             )
             //
             //                         ),
             //                       )
             //                           :
             //                       daySelected && index.toString() == selectedIndex &&  "0$currentday".toString() != selectedDay
             //
             //                     ?
             //                       CircleAvatar(
             //                         radius: 30,
             //                         backgroundColor: AppTheme.themePink, // Customize background color
             //                         child: Text(
             //                           day,
             //                           style: TextStyle(color: Colors.black),
             //                         ),
             //                       )
             //                       :
             //                       CircleAvatar(
             //                         radius: 30,
             //                         backgroundColor: AppTheme.white, // Customize background color
             //                         child: Text(
             //                           day,
             //                           style: TextStyle(color: Colors.black),
             //                         ),
             //                       )
             //
             //                       ,
             //                     ),
             //                   );
             //                 },
             //               ),
             //             ),
             //           ),
             //   ]
             //         ),
             //
             //         daySelected ?
             //         Positioned(
             //           top: 1.h,
             //           child: Padding(
             //             padding:  EdgeInsets.fromLTRB(1.w,0,0,0),
             //             child: Container(
             //                 decoration: BoxDecoration(
             //                     color: Colors.white,
             //                     borderRadius: BorderRadius.circular(20)
             //                 ),
             //                 height: 40.h,
             //                 width: 100.w,
             //                 child:
             //
             //
             //                 Column(
             //                   mainAxisAlignment: MainAxisAlignment.center,
             //                   children: [
             //                     Padding(
             //                       padding:  EdgeInsets.fromLTRB(0,0,5.w,0),
             //                       child: Row(
             //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
             //                         children: [
             //                           CommonUI().myText(text: "Track your Menstruation and Treatment")
             //
             //
             //
             //
             //                         ],
             //                       ),
             //                     ),
             //                     Gap(3.h)
             //                   ],
             //                 )
             //
             //               ////////////////////////////////////////////////////////////////
             //               // Stack(
             //               //     children:
             //               //     [
             //               //       Center(
             //               //         child:
             //               //         Stack(
             //               //           children: [
             //               //             Transform.rotate(
             //               //                 angle: radians(-30), // Adjust the angle to tilt the circle
             //               //                 child:
             //               //                 CircularProgressIndicatorTilted(
             //               //                   progress: 0.6, // Change this value to test different progress levels
             //               //                   day: 6, // Day number to be displayed
             //               //                   filledColor: const Color(0xFF742B8E), // Color for filled progress
             //               //                   unfilledColor: const Color(0xFFFF9797), // Color for unfilled progress
             //               //                   outlineColor: const Color(0xFF742B8E),
             //               //                   tiltAngle: -27,// Outline color for both filled and unfilled progress
             //               //                 )
             //               //               // CustomPaint(
             //               //               //   size: Size(200, 200),
             //               //               //   painter: _CircularProgressWithDayNumberPainter(0.5, 5),
             //               //               //   // painter: _CircularProgressPainter(0.5, 5),
             //               //               //   // painter: CirclePainter(progress: 10),
             //               //               // ),
             //               //             ),
             //               //             Positioned(
             //               //                 top: 3,
             //               //                 left: 16,
             //               //                 child: Icon(
             //               //                   Icons.leak_remove_sharp,
             //               //                   size: 29.sp,
             //               //                 ))
             //               //           ],
             //               //         ),
             //               //
             //               //       ),
             //               //       Positioned(
             //               //           top: 87,
             //               //           left: 100,
             //               //           child:
             //               //           Column(
             //               //             children: [
             //               //               Text("Cycle 1",
             //               //                 style: TextStyle(
             //               //                     color: Color(0xFFF555A2),
             //               //                     fontWeight: FontWeight.bold
             //               //                 ),),
             //               //               Text("Now simulation process ",
             //               //                 style: TextStyle(
             //               //                   fontSize: 10.sp,
             //               //                   color: Color(0xFFE8388D),
             //               //                 ),),
             //               //               Text(" is ongoing on",
             //               //                 style: TextStyle(
             //               //                   color: Color(0xFFE8388D),
             //               //                 ),),
             //               //               Text("till (10/02/2024)",
             //               //                 style: TextStyle(
             //               //                   color: Color(0xFFE8388D),
             //               //                 ),),
             //               //             ],
             //               //           ))
             //               //     ]
             //               // ), //old design wrong
             //             ),
             //           ),
             //         )
             //             :
             //         SizedBox(),
             //       ],
             //     ),
             //
             //
             //       daySelected ?
             //       Positioned(
             //         top: 1.h,
             //
             //           child:
             //           Image.asset(AppConstants.purpleLine, scale: 2.4,)
             //       )
             //           :
             //           SizedBox()
             //             ]
             //   ),
             // ),

              // Gap(3.h),
              Gap(2.h),
              Stack(
                // overflow: Overflow.visible, // Allow overflow for Positioned widget
                children: [
                  Container(
                    height: 30.h,
                  ),
                  Positioned(
                    top: 4.h,
                    left: 4.w,
                    child: Container(
                      height: 21.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          // color: AppTheme.fontGrey,
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFE8388D), // First color
                              Color(0xFF752B8E), // Second color
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(3.w, 1.h, 2.w, 3.h),
                        child: Row(
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(3.h),
                                CommonUI().myText(
                                  text: "Celebrating Milestones at",
                                  color: AppTheme.white,
                                  fontfamily: "Nunito",
                                  fontSize: 8.sp,
                                ),
                                Gap(1.h),
                                CommonUI().myText(
                                    text: "Prashanth Hospital ",
                                    color: AppTheme.white,
                                    fontfamily: "Nunito",
                                    fontSize: 10.2.sp,
                                    fontWeight: FontWeight.w600),
                                Gap(1.h),
                                CommonUI().myText(
                                    text: "IVF Center",
                                    color: AppTheme.white,
                                    fontfamily: "Nunito",
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600),
                                Gap(1.h),
                                Row(
                                  children: [
                                    CommonUI().myText(
                                        text: "50,000+",
                                        color: AppTheme.white,
                                        fontfamily: "Nunito",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700),
                                    CommonUI().myText(
                                        text: " Babies Delivered",
                                        color: AppTheme.white,
                                        fontfamily: "Nunito",
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w600),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8.w,
                    top: -1, // 20% of the container height
                    child: Image.asset(
                      AppConstants.doctorsGroup,
                      scale: 3.5, // Replace with your image asset
                      // width: 100, // Set the width of the image
                      // height: 140, // Set the height of the image
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Gap(2.h),
              Padding(
                padding: EdgeInsets.fromLTRB(4.w, 0, 0, 0),
                child: Container(
                  height: 74.h,
                  width: 100.w,
                  // color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonUI().myText(
                          text: "Educational Resources",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontfamily: "Nunito"),
                      Gap(2.h),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                        child: Container(
                          width: 100.w,
                          height: 6.5.h,
                          decoration: BoxDecoration(
                              color: AppTheme.formFieldGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),

                              // filled: true,
                              //   fillColor: AppTheme.formFieldGrey,
                              prefixIcon: IconButton(
                                icon: _isSearching
                                    ? Icon(
                                        Icons.clear,
                                        size: 20.sp,
                                        color: AppTheme.themePink,
                                      )
                                    : Image.asset(
                                        AppConstants.searchIcon,
                                        scale: 3,
                                      ),

                                // Icon(_isSearching ? Icons.clear : Icons.search,
                                //
                                // color: AppTheme.themePink,),
                                onPressed: () {
                                  if (_isSearching) {
                                    _onClear();
                                  }
                                },
                              ),
                              hintText: 'Search...',
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(8.0),
                              // ),
                            ),
                            onChanged: (text) {
                              setState(() {
                                _isSearching = text.isNotEmpty;
                              });
                            },
                          ),
                        ),
                      ),
                      Gap(2.h),
                      Container(
                        height: 10.h,
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Gap(2.w),
                            Column(
                              children: [
                                Image.asset(
                                  AppConstants.spermIcon,
                                  scale: 4,
                                ),
                                CommonUI().myText(
                                    text: "IVF",
                                    fontSize: 12.sp,
                                    color: AppTheme.textPink,
                                    fontWeight: FontWeight.w500,
                                    fontfamily: "Nunito"),
                              ],
                            ),
                            Gap(4.w),
                            Column(
                              children: [
                                Image.asset(
                                  AppConstants.uterusIcon,
                                  scale: 4,
                                ),
                                CommonUI().myText(
                                    text: "IUI",
                                    fontSize: 12.sp,
                                    color: AppTheme.textPink,
                                    fontWeight: FontWeight.w500,
                                    fontfamily: "Nunito"),
                              ],
                            ),
                            Gap(4.w),
                            Column(
                              children: [
                                Image.asset(
                                  AppConstants.labSamplesSperm,
                                  scale: 4,
                                ),
                                CommonUI().myText(
                                    text: "ICSI",
                                    fontSize: 12.sp,
                                    color: AppTheme.textPink,
                                    fontWeight: FontWeight.w500,
                                    fontfamily: "Nunito"),
                              ],
                            ),
                            Gap(5.w)
                          ],
                        ),
                      ),
                      Gap(4.h),
                      CommonUI().myText(
                          text: "Trending Now",
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          fontfamily: "Nunito"),
                      Gap(1.5.h),
                      Container(
                        height: 41.h,
                        // color: Colors.purple,
                        child: Column(
                          children: [
                            Container(
                              height: 31.h,
                              // color: Colors.yellow,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 2,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Stack(children: [
                                      Container(
                                        height: 33.5.h,
                                        width: 48.w,
                                        // color: Colors.purple[50],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          print("ontap image");
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      StoryPage()));
                                        },
                                        child: Positioned(
                                          top: 3.h,
                                          child: Container(
                                              height: 28.h,
                                              width: 45.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                // color: Colors.green,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(23),
                                                child: Image.network(
                                                  "https://fastly.picsum.photos/id/10/2500/1667.jpg?hmac=J04WWC_ebchx3WwzbM-Z4_KC_LeLBWr5LZMaAkWkF68",
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                              // Image.asset(AppConstants.prashanthLogo),
                                              ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 173,
                                        child: Container(
                                          width: 43.w,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                2.w, 0, 0, 0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonUI().myText(
                                                  text:
                                                      "Food to nourish the eggs and",
                                                  color: AppTheme.white,
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.visible,
                                                  fontfamily: "Nunito",
                                                  fontSize: 8.sp,
                                                ),
                                                CommonUI().myText(
                                                  text:
                                                      "uterus and accelerate ovulation",
                                                  color: AppTheme.white,
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.visible,
                                                  fontfamily: "Nunito",
                                                  fontSize: 8.sp,
                                                ),
                                                CommonUI().myText(
                                                  text: "for the mother-to-be",
                                                  color: AppTheme.white,
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.visible,
                                                  fontfamily: "Nunito",
                                                  fontSize: 8.sp,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: isVideo ? 26.h : 24.8.h,
                                          left: 32.w,
                                          child: Image.asset(
                                            isVideo
                                                ? AppConstants
                                                    .rightArrowPlayIcon
                                                : AppConstants.playButton,
                                            scale: 4,
                                          ))
                                    ]);
                                  }),
                            ),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //
                            //     Stack(
                            //       children:[
                            //         Container(
                            //          height: 33.5.h,
                            //           width: 48.w,
                            //           // color: Colors.purple[50],
                            //         ),
                            //         Positioned(
                            //           top: 3.h,
                            //           child: Container(
                            //             height: 28.h,
                            //             width: 45.w,
                            //             decoration: BoxDecoration(
                            //               borderRadius: BorderRadius.circular(25),
                            //               color: Colors.blue,
                            //             ),
                            //             child: ClipRRect(
                            //               borderRadius: BorderRadius.circular(23),
                            //               child: Image.network(
                            //                 "https://fastly.picsum.photos/id/10/2500/1667.jpg?hmac=J04WWC_ebchx3WwzbM-Z4_KC_LeLBWr5LZMaAkWkF68",
                            //                 fit: BoxFit.cover,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //
                            //         Positioned(
                            //           top: 185,
                            //           child: Container(
                            //             width: 43.w,
                            //             child: Padding(
                            //               padding:  EdgeInsets.fromLTRB(2.w,0,0,0),
                            //               child: Column(
                            //                 mainAxisAlignment: MainAxisAlignment.start,
                            //                 crossAxisAlignment: CrossAxisAlignment.start,
                            //                 children: [
                            //                   CommonUI().myText(
                            //                     text:
                            //                     "Food to nourish the eggs and",
                            //                     color: AppTheme.white,
                            //                     maxLines: 4,
                            //                     overflow: TextOverflow.visible,
                            //                     fontfamily: "Nunito",
                            //                     fontSize: 8.sp,
                            //                   ),
                            //                   CommonUI().myText(
                            //                     text:
                            //                     "uterus and accelerate ovulation",
                            //                     color: AppTheme.white,
                            //                     maxLines: 4,
                            //                     overflow: TextOverflow.visible,
                            //                     fontfamily: "Nunito",
                            //                     fontSize: 8.sp,
                            //                   ),
                            //                   CommonUI().myText(
                            //                     text:
                            //                     "for the mother-to-be",
                            //                     color: AppTheme.white,
                            //                     maxLines: 4,
                            //                     overflow: TextOverflow.visible,
                            //                     fontfamily: "Nunito",
                            //                     fontSize: 8.sp,
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           ),
                            //
                            //
                            //
                            //         ),
                            //         Positioned(
                            //             top: 27.6.h,
                            //             left: 32.w,
                            //             child:
                            //             Image.asset(AppConstants.playButton, scale: 4,))
                            //
                            //       ]
                            //
                            //     ),
                            //   ],
                            // ),
                            Gap(2.h),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EducationResourceHome()));
                              },
                              child: Center(
                                child: CommonUI().buttonContainer(
                                    borderradius: 10,
                                    color: AppTheme.themePink,
                                    height: 4.3.h,
                                    width: 20.w,
                                    child: Center(
                                      child: CommonUI().myText(
                                          text: "See More",
                                          color: AppTheme.white,
                                          overflow: TextOverflow.visible,
                                          fontSize: 10.sp,
                                          fontfamily: "Nunito",
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ///////////

              // Gap(4.h),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(4.w, 0, 0, 0),
                    child: CommonUI().myText(text: "Daily Tracking",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontfamily: "Nunito"
                    ),
                  ),

                  Stack(children: [
                    Container(
                      height: 24.h,
                      // color: Colors.yellow,
                    ),
                    Positioned(
                        top: 5.h,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                          child: Image.asset(
                            AppConstants.heartBeatBakcground,
                            scale: 1,
                          ),
                        )),
                    Positioned(
                        left: 8.w,
                        top: -2.h,
                        child: Image.asset(
                          AppConstants.redHeartBeat,
                          scale: 4,
                        )),
                    Positioned(
                        top: 7.5.h,
                        left: 57.w,

                        child: CommonUI().buttonContainer(
                            height: 3.h,
                            width: 30.w,
                            color: AppTheme.white,
                            child: Center(
                              child: CommonUI().myText(text: "+ Start Tracking",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.textPink,

                              ),
                            )
                        )
                    ),
                    Positioned(
                        top: 13.h,
                        left: 8.w,

                        child:
                        Container(
                          width: 80.w,
                          child: CommonUI().myText(text: "\“Monitor your well-being effortlessly with your wearables\"",
                              color: AppTheme.white,
                              overflow: TextOverflow.visible,
                              maxLines: 2,
                              fontWeight: FontWeight.w600,
                              fontfamily: "Nunito"
                          ),
                        )
                    )
                  ])
                ],
              ),
              Gap(2.h),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CommonUI().myText(text: "Diets",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontfamily: "Nunito"
                  ),
                  Gap(49.w),
                  CommonUI().myText(text: "View all",
                      fontSize: 11.sp,
                      color: AppTheme.textPink,
                      fontWeight: FontWeight.w600,
                      fontfamily: "Nunito"
                  ),

                ],
              ),
              Gap(2.h),

              Container(
                width: 100.w,
                height: 26.h,
                // color: Colors.amber,
                child: ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,

                    itemBuilder: ( context,  index){

                      return Padding(
                        padding:  EdgeInsets.fromLTRB(4.w,0,4.w,1.h),
                        child: Container(
                          height: 10.h,
                          width: 43.w,
                          decoration: BoxDecoration(
                            color: AppTheme.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[200]!,
                                offset: Offset(-1.0, -1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8)
                                ),

                                child: Image.asset(AppConstants.juiceImage,
                                  ),
                              ),


                              Padding(
                                padding:  EdgeInsets.fromLTRB(2.w,0,0,0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Gap(1.h),

                                    CommonUI().myText(text: "Green Smoothie", color: AppTheme.textPink,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    fontfamily: "Nunito"),

                                    Gap(0.4.h),
                                    Row(
                                      children: [
                                        CommonUI().myText(text: "Doctor verified ",

                                        fontSize: 8.sp,
                                        color: AppTheme.textPurple,
                                        fontWeight: FontWeight.w500,
                                        fontfamily: "Nunito"),
                                        Image.asset(AppConstants.verifiedIcon, scale: 3,)
                                      ],
                                    ),
                                    Gap(0.3.h),


                                    CommonUI().myText(text: "Eating enough iron can help prevent iron deficiencies........",
                                        // color: AppTheme.textink,
                                        fontSize: 7.8.sp,
                                        overflow: TextOverflow.visible,
                                        maxLines: 4,

                                        fontWeight: FontWeight.w500,
                                        fontfamily: "Nunito"),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                }),
              ),
              Gap(3.h),
            Padding(
              padding:  EdgeInsets.fromLTRB(3.w,0,3.w,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonUI().myText(text: "Quick Tips",
                      fontSize: 13.sp,
                      fontfamily: "Nunito",
                      fontWeight: FontWeight.w600
                  ),
                  Gap(2.h),
                  Container(
                    height: 31.4.h,
                    width: 100.w,
                    // color: AppTheme.white,
                    decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200]!,
                            offset: Offset(-1.0, -1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ]
                    ),

                    child: Padding(
                      padding:  EdgeInsets.fromLTRB(2.w,0,0,0),
                      child: Column(
                        children: [
                          CarouselSlider(

                              options: CarouselOptions(
                                  height: 250.0,
                                  viewportFraction: 1.5,
                                  initialPage: 0,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  }),
                              items:

                              [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Gap(20.w),
                                    Container(
                                        height: 26.h,
                                        width: 35.w,
                                        // color: Colors.red,
                                        child: Padding(
                                          padding:  EdgeInsets.fromLTRB(2.w,0,0,0),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(23),
                                            child: Image.asset(AppConstants.sleepImage,
                                              // scale: 3,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )),
                                    // Gap(3.w),

                                    Container(
                                      height: 26.h,
                                      width: 50.w,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CommonUI().myText(text: "Sleep 8 hours Daily",                                  fontfamily: "Nunito",
                                              textAlign: TextAlign.justify,
                                              fontSize: 14.sp,
                                              color: AppTheme.textPink,
                                              maxLines: 4,
                                              overflow: TextOverflow.visible
                                          ),
                                          Gap(0.7.h),
                                          Row(
                                            children: [
                                              CommonUI().myText(text: "Doctor verified ",
                                                  fontSize: 9.sp,
                                                  color: AppTheme.textPurple,
                                                  fontWeight: FontWeight.w500,
                                                  fontfamily: "Nunito"),
                                              Image.asset(AppConstants.verifiedIcon, scale: 3,)
                                            ],
                                          ),
                                          Gap(0.9.h),

                                          CommonUI().myText(
                                              lineHeight: 1.1.sp,
                                              text: "Sleep is a state of reduced mental and physical activity in which consciousness is altered and certain sensory activity is inhibited. During sleep, there is a marked decrease in muscle activity......",
                                              fontfamily: "Nunito",
                                              textAlign: TextAlign.justify,
                                              fontSize: 10.2.sp,
                                              maxLines: 10,
                                              overflow: TextOverflow.visible
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(25.w)
                                  ],
                                )

                              ]

                          ),

                        ],
                      ),
                    ),
                  ),
                  Gap(1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DotsIndicator(
                        dotsCount: imageList.length,
                        position: _current!.toDouble().toInt(),
                        decorator: DotsDecorator(
                          activeColor: AppTheme.themePink,
                          shape: CircleBorder(),

                          activeShape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                          size: Size(10, 10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

              Padding(
                padding:  EdgeInsets.fromLTRB(3.w,2.h,0,2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonUI().myText(text: "Testimonials",
                        fontSize: 14.sp,
                        fontfamily: "Nunito",
                        fontWeight: FontWeight.w600
                    ),
                  ],
                ),
              ),
              Stack(
                
                children:[
                  Container(
                    height: 48.h,
                    width: 110.w,
                    // color:Colors.amber
                  ),

                  Positioned(
                    top: 2.h,
                    child: Padding(
                      padding:  EdgeInsets.fromLTRB(3.w,0,3.w,0),
                      child: Container(
                        // height: 10.h,
                        width: 94.w,
                        decoration: BoxDecoration(
                          // color: Colors.pink[200],
                          color: AppTheme.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200]!,
                              offset: Offset(-1.0, -1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child:
                        Padding(
                          padding:  EdgeInsets.fromLTRB(2.w,1.h,0,0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(AppConstants.docProfile, scale: 3,),
                                  Gap(3.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonUI().myText(text: "Mrs. Meghana Sree",
                                          color: AppTheme.themePink,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600
                                      ),
                                      CommonUI().myText(text: "IVF Treatment",
                                          color: AppTheme.grey,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ],
                                  ),
                                  Gap(27.w)
                                ],
                              ),
                              Gap(2.h),
                              Row(
                                children: [
                                  Container(
                                    height: 30.h,
                                    width:87.w,
                                    child: CommonUI().myText(text:
                                    "I am delighted to share my heartfelt testimonial about my incredible journey with Prashanth Fertility Center. After years of struggling with infertility and experiencing numerous disappointments, my husband and I decided to seek help from Prashanth Fertility. From the moment we stepped into the clinic, we were welcomed with warmth and compassion, which instantly put us at ease."
                                        ,
                                        fontSize: 12.sp,
                                        overflow: TextOverflow.visible,
                                        maxLines: 14,
                                        textAlign: TextAlign.justify,
                                        color: AppTheme.fontGrey,
                                        fontWeight: FontWeight.w600,
                                        fontfamily: "Nunito"

                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0.1.h,
                      left: 78.w,
                      child:
                  Image.asset(AppConstants.quotesIcon, scale: 3,)
                  )
                ] 
                  
              )


            ],
          ),
        ),
      ),
    );
  }
}
