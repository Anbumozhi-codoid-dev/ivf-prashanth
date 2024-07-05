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

  void _onClear() {
    _controller.clear();
    setState(() {
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 260.h,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 30.h,
                width: 90.w,
                color: AppTheme.themePink,
                child: CommonUI().myText(text: "calendar contianer"),
              ),
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
                        padding: EdgeInsets.fromLTRB(4.w, 0, 0, 0),
                        child: Container(
                          width: 80.w,
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
                            Gap(5.w),
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
                            Gap(2.w),
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
                            Gap(2.w),
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
                            scale: 3.8,
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
                        left: 60.w,

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
                        top: 15.h,
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
              
              Container(
                width: 100.w,
                height: 25.h,
                child: ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,

                    itemBuilder: ( context,  index){

                      return Padding(
                        padding:  EdgeInsets.fromLTRB(4.w,0,4.w,0),
                        child: Container(
                          height: 10.h,
                          width: 43.w,
                          decoration: BoxDecoration(
                            color: AppTheme.white,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15)
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
                                        Image.asset(AppConstants.verifiedIcon, scale: 10,)
                                      ],
                                    ),


                                    CommonUI().myText(text: "Eating enough iron can help prevent iron deficiencies........", color: AppTheme.textPink,
                                        fontSize: 7.sp,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
