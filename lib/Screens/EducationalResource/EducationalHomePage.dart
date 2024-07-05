import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Utils/AllImports.dart';

class EducationResourceHome extends StatefulWidget {
  const EducationResourceHome({super.key});

  @override
  State<EducationResourceHome> createState() => _EducationResourceHomeState();
}

class _EducationResourceHomeState extends State<EducationResourceHome> {

  TextEditingController _searchController = TextEditingController();

  bool _isSearching = false;
  bool _isIVF= false;
  bool _isIUI = false;
  bool _isICSI = false;
  bool isVideo = false;

  void _onClear() {
    _searchController.clear();
    setState(() {
      _isSearching = false;
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isIVF= true;
    _isIUI = false;
    _isICSI = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(

        backgroundColor: AppTheme.themePink,
        centerTitle: true,
        automaticallyImplyLeading: false,

        toolbarHeight: 10.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            //  Radius.circular(12.h)
            bottomRight: Radius.circular(7.h),
            bottomLeft: Radius.circular(7.h),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset(AppConstants.leftArrowSquare, scale: 3.6,)),

              Gap(10.w),
              Container(
                width: 60.w,
                child: CommonUI().myText(
                    text:
                    "Educational Resource",
                    color: AppTheme.white,
                    fontSize: 16.sp,
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                    fontfamily: "Nunito",
                    fontWeight: FontWeight.w500),
              ),
              Gap(10.w)
            ],
          ),
          Gap(2.h)
        ],

            ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(2.w,0,2.w,0),
          child: Column(
            children: [
              Gap(2.h),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  width: 90.w,
                  height: 6.5.h,
                  decoration: BoxDecoration(
                      color: AppTheme.formFieldGrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _searchController,
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
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _isIVF = !_isIVF;
                          _isIUI = false;
                          _isICSI = false;

                        });

                      },
                      child: Column(
                        children: [
                        _isIVF ?

                        Image.asset(
                            AppConstants.spermIconSelected,
                            scale: 4,
                          )
                        :
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
                    ),
                    Gap(2.w),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _isIUI = !_isIUI;
                          _isIVF = false;
                          _isICSI = false;

                        });
                      },
                      child: Column(
                        children: [
                        _isIUI ?

                          Image.asset(
                            AppConstants.uterusIconSelected,
                            scale: 4,
                          )
                        :
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
                    ),
                    Gap(2.w),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _isICSI = !_isICSI;
                          _isIUI = false;
                          _isIVF = false;

                        });
                      },
                      child: Column(
                        children: [
                          _isICSI ?
                          Image.asset(
                            AppConstants.labSamplesSpermSelected,
                            scale: 4,
                          )
                          :
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
                    ),
                    Gap(5.w)
                  ],
                ),
              ),

              Gap(4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CommonUI().myText(
                      text: "Articles for you!",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      fontfamily: "Nunito"),
                  Gap(40.w),
                  CommonUI().myText(
                      text: "View all",
                      fontSize: 11.sp,
                      // lineHeight: 2.sp,
                      color: AppTheme.textPink,
                      fontWeight: FontWeight.w600,
                      fontfamily: "Nunito"),
                  Gap(2.w)
                ],
              ),
              Gap(2.h),
              Container(
                height: 35.h,
                // color: Colors.purple,
                child: Column(
                  children: [

                    Container(
                      height: 33.5.h,
                      // color: Colors.yellow
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index){

                            return  Stack(
                                children: [
                                  Container(
                                    height: 33.5.h,
                                    width: 48.w,
                                    // color: Colors.purple[50],
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      print("ontap image");
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=> StoryPage()));
                                    },
                                    child: Positioned(
                                      top: 3.h,
                                      child: Container(
                                          height: 28.h,
                                          width: 45.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            // color: Colors.green,
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(23),
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
                                      width: 45.w,
                                      height: 8.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(23),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.center,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black87.withOpacity(1.0),
                                          ],
                                        ),
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.fromLTRB(2.w,0,0,0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CommonUI().myText(
                                              text:
                                              "Food to nourish the eggs and",
                                              color: AppTheme.white,
                                              maxLines: 4,
                                              overflow: TextOverflow.visible,
                                              fontfamily: "Nunito",
                                              fontSize: 8.sp,
                                            ),
                                            CommonUI().myText(
                                              text:
                                              "uterus and accelerate ovulation",
                                              color: AppTheme.white,
                                              maxLines: 4,
                                              overflow: TextOverflow.visible,
                                              fontfamily: "Nunito",
                                              fontSize: 8.sp,
                                            ),
                                            CommonUI().myText(
                                              text:
                                              "for the mother-to-be",
                                              color: AppTheme.white,
                                              maxLines: 4,
                                              overflow: TextOverflow.visible,
                                              fontfamily: "Nunito",
                                              fontSize: 8.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),



                                  ),
                                  Positioned(
                                      top:  isVideo ? 26.h : 26.5.h,
                                      left: 31.w,
                                      child:
                                      Image.asset(

                                        isVideo ?  AppConstants.rightArrowPlayIcon
                                            :
                                        AppConstants.playButton, scale: 4,))

                                ]);
                          }),
                    ),



                  ],
                ),
              ),


              Gap(1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CommonUI().myText(
                      text: "Quick Tips",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      fontfamily: "Nunito"),
                  Gap(40.w),
                  CommonUI().myText(
                      text: "View all",
                      fontSize: 11.sp,
                      // lineHeight: 2.sp,
                      color: AppTheme.textPink,
                      fontWeight: FontWeight.w600,
                      fontfamily: "Nunito"),
                  Gap(2.w)
                ],
              ),
              Gap(2.h),
              Container(
                height: 35.h,
                // color: Colors.purple,
                child: Column(
                  children: [

                    Container(
                      height: 33.5.h,
                      // color: Colors.yellow,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index){

                            return  Stack(
                                children: [
                                  Container(
                                    height: 33.5.h,
                                    width: 48.w,
                                    // color: Colors.purple[50],
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      print("ontap image");
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=> StoryPage()));
                                    },
                                    child: Positioned(
                                      top: 3.h,
                                      child: Container(
                                          height: 28.h,
                                          width: 45.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            // color: Colors.green,
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(23),
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
                                    child:
                                    Container(
                                      width: 45.w,
                                      height: 8.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(23),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.center,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black87.withOpacity(1.0),
                                          ],
                                        ),
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.fromLTRB(2.w,0,0,0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CommonUI().myText(
                                              text:
                                              "Short and long IVF Protocol Which is better?",
                                              color: AppTheme.white,
                                              maxLines: 4,
                                              overflow: TextOverflow.visible,
                                              fontfamily: "Nunito",
                                              fontSize: 8.sp,
                                            ),
                                            CommonUI().myText(
                                              text:
                                              "uterus and accelerate ovulation",
                                              color: AppTheme.white,
                                              maxLines: 4,
                                              overflow: TextOverflow.visible,
                                              fontfamily: "Nunito",
                                              fontSize: 8.sp,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),



                                  ),
                                  Positioned(
                                      top:  !isVideo ? 27.3.h : 26.5.h,
                                      left: 30.w,
                                      child:
                                      Image.asset(

                                        !isVideo ?  AppConstants.rightArrowPlayIcon
                                            :
                                        AppConstants.playButton, scale: 4,))

                                ]);
                          }),
                    ),



                  ],
                ),
              ),





              Gap(1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CommonUI().myText(
                      text: "Shorts of IVF Treatment",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      fontfamily: "Nunito"),
                  Gap(30.w),
                  CommonUI().myText(
                      text: "View all",
                      fontSize: 11.sp,
                      // lineHeight: 2.sp,
                      color: AppTheme.textPink,
                      fontWeight: FontWeight.w600,
                      fontfamily: "Nunito"),
                  Gap(2.w)
                ],
              ),
              Gap(2.h),
              Container(
                height: 34.h,
                // color: Colors.purple,
                child: Column(
                  children: [

                    Container(
                      height: 33.5.h,
                      // color: Colors.yellow,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index){

                            return  Stack(
                                children: [
                                  Container(
                                    height: 33.5.h,
                                    width: 48.w,
                                    // color: Colors.purple[50],
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      print("ontap image");
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=> StoryPage()));
                                    },
                                    child: Positioned(
                                      top: 3.h,
                                      child: Container(
                                          height: 25.h,
                                          width: 45.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            // color: Colors.green,
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(23),
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
                                      top:  22.h,
                                      left: 30.w,
                                      child:
                                      Image.asset(


                                        AppConstants.playButton, scale: 4,))

                                ]);
                          }),
                    ),



                  ],
                ),
              ),

              Gap(1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CommonUI().myText(
                      text:  "Videos of IVF Treatment",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      fontfamily: "Nunito"),
                  Gap(22.w),
                  CommonUI().myText(
                      text: "View all",
                      fontSize: 11.sp,
                      // lineHeight: 2.sp,
                      color: AppTheme.textPink,
                      fontWeight: FontWeight.w600,
                      fontfamily: "Nunito"),
                  Gap(2.w)
                ],
              ),
              Gap(2.h),

              Stack(
                
                children:[
                  
                 Container(
                  height: 22.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      color: Colors.green[200],
                
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                  
                  Positioned(
                    top: 7.h,
                      left: 36.w,
                      child:
                  Image.asset(AppConstants.playButton, scale: 3,)
                  )
          ]
              ),
              Gap(3.h),
            ],
          ),
        ),
      ),

    );
  }
}
