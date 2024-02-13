import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uds_employee/Allnavigations/AllNavigationsDirectory.dart';
import 'package:uds_employee/Allnavigations/AllimportedDirectory.dart';
import 'package:uds_employee/Bloc/LeaveBloc.dart';
import '../../../Allnavigations/AllBlocDirectory.dart';
import 'LeaveApply.dart';
import 'LeaveHistory.dart';
import 'LeaveHistoryDetails.dart';

class LeaveScreen extends StatefulWidget {
   LeaveScreen({Key? key,this.userId}) : super(key: key);
  String? userId;

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  var status="pending";
  List<LeaveStatusType>   leavedata=[];
  String? userid;
  String? availableLeaves;
  String? validdate;
  String? pendingLeaves;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }


  getUserId() async{
    print("get un");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userid = prefs.getString('id');

    });
        print('userid');
        print(userid);

  }


  @override
  Widget build(BuildContext context) {
    return
    WillPopScope( onWillPop:() {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardScreen(index: 1,)));
      return Future(() => false);

    },
    child:
    BlocProvider( create: (context){

      var bloc=LeaveBloc();

      bloc.add(LeaveStatusEvent(context, widget.userId!, status));

      return bloc;
    },
        child: BlocListener<LeaveBloc,LeaveState>(
          listener: (context,state){
            if(state is LeaveStatusSuccessState){

              print(state.data['data']);
              print("state.data['data']['total_leave']");
              print(state.data['data']['data']['total_leave']);
              print("pendingleave===");
              print(state.data['data']['data']['pending_leave']);
              validdate=state.data['data']['data']['leave_valid_until'];
              availableLeaves=state.data['data']['data']['total_leave'].toString();
              pendingLeaves=state.data['data']['data']['pending_leave'].toString();
              var data=state.data['data']['data']['data'];
              leavedata.clear();
              print(data.length);
              for(int i=0;i<data.length;i++){
                leavedata.add(LeaveStatusType.fromJson(data[i]));
              }

              print('leavedata.length');
              print(leavedata.length);


            }
          },
          child: BlocBuilder<LeaveBloc,LeaveState>(
            builder: (context,state){


              return
                // state is LeaveStatusSuccessState
                //   ?


                Scaffold(
                  backgroundColor: AppTheme.whiteColor,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: AppTheme.whiteColor,
                    automaticallyImplyLeading: false,
                    title: Row(
                      children: [
                        IconButton(onPressed: (){

                          // Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardScreen(index: 1,)));

                        }, icon: Icon(Icons.arrow_back_ios)),
                        CommonUI().myText(text: "LEAVE LIST")
                      ],
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          availableLeaves !=null  && validdate !=null ?    _buildhours():SizedBox(),
                          Gap(2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonUI.buttonContainer(
                                  gradientfirst:

                                  status =="pending" ?  AppTheme.primaryColor2 : AppTheme.whiteColor ,
                                  gradientsecond:
                                  status =="pending" ? AppTheme.primaryColor1 : AppTheme.whiteColor,
                                  height: 4.h,
                                  width: 30.w,
                                  onPressed: () {
                                    setState(() {
                                      status = "pending";
                                      BlocProvider.of<LeaveBloc>(context).add(LeaveStatusEvent(context, widget.userId!, status));



                                    });


                                  },
                                  file: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonUI().myText(
                                          text: "Pending",
                                          color: status =="pending"
                                              ? AppTheme.whiteColor
                                              : AppTheme.blackColor)
                                    ],
                                  )),
                              Gap(1.w),
                              CommonUI.buttonContainer(
                                  gradientfirst:
                                  status=="approved" ? AppTheme.primaryColor2 : AppTheme.whiteColor,
                                  gradientsecond:
                                  status=="approved" ? AppTheme.primaryColor1 : AppTheme.whiteColor,
                                  height: 4.h,
                                  width: 30.w,
                                  onPressed: () {
                                    print("isComplete pressed");
                                    setState(() {
                                      status = "approved";
                                      BlocProvider.of<LeaveBloc>(context).add(LeaveStatusEvent(context, widget.userId!, status));


                                    });

                                  },
                                  file: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonUI().myText(
                                          text: "Approved",
                                          fontSize: 10.sp,
                                          color: status =="approved"
                                              ? AppTheme.whiteColor
                                              : AppTheme.blackColor)
                                    ],
                                  )),
                              Gap(1.w),
                              CommonUI.buttonContainer(
                                  gradientfirst:
                                  status=="decline" ? AppTheme.primaryColor2 : AppTheme.whiteColor,
                                  gradientsecond:
                                  status =="decline" ? AppTheme.primaryColor1 : AppTheme.whiteColor,
                                  height: 4.h,
                                  width: 30.w,
                                  onPressed: () {
                                    print("isComplete pressed");
                                    setState(() {
                                      status = "decline";
                                      BlocProvider.of<LeaveBloc>(context).add(LeaveStatusEvent(context, widget.userId!, status));

                                    });

                                  },
                                  file: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonUI().myText(
                                          text: "Decline",
                                          fontSize: 10.sp,
                                          color: status=="decline"
                                              ? AppTheme.whiteColor
                                              : AppTheme.blackColor)
                                    ],
                                  )),
                            ],
                          ),
                          Gap(1.h),
                          _buildLeave(context),
                          Gap(2.h),
                          // Row(
                          //   children: [
                          //     Spacer(),
                          //     GestureDetector(
                          //         onTap: (){
                          //           Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveHistoryScreen(userId: widget.userId!,)));
                          //         },
                          //         child: CommonUI().myText(text: "VIEW LEAVE HISTORY",fontSize: 10.sp,color: AppTheme.buttonColor)),
                          //     Gap(2.h),
                          //   ],
                          // ),
                          Gap(5.h),


                        ],
                      ),
                    ),
                  ),
                  bottomNavigationBar:  Padding(
                    padding:  EdgeInsets.fromLTRB(2.w,1.h,2.w,2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Spacer(),

                        Material(
                          elevation: 5,
                          color: Colors.transparent,
                          child: CommonUI.buttonContainer(
                              height: 4.h,
                              width: 30.w,
                              gradientfirst: AppTheme.buttonColor,
                              gradientsecond: AppTheme.buttonColor,
                              onPressed: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveApplyScreen(userId: widget.userId!,)));
                              }, file: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonUI().myText(text: "APPLY",color: AppTheme.whiteColor,fontSize: 10.sp)

                            ],)),
                        ),
                        Gap(2.h),

                      ],
                    ),
                  ),
                ) ;

            },
          ),
        )


    )
      );




  }

  Widget _buildhours() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //height: 10.h,
        //   width: 90.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.primaryColor2, AppTheme.primaryColor1],
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Gap(1.h),
              Row(
                children: [
                  CommonUI().myText(
                      text: "Available Leaves",
                      color: AppTheme.whiteColor,
                      fontSize: 11.sp),
                  Spacer(),
                  CommonUI().myText(
                      text: pendingLeaves!.toString(), fontSize: 16.sp, color: AppTheme.whiteColor),
                  CommonUI().myText(
                      text: '/$availableLeaves Days',
                      fontSize: 10.sp,
                      color: AppTheme.whiteColor),
                  Gap(1.h)
                ],
              ),
              Gap(3.h),
              Row(
                children: [
                  CommonUI().myText(
                      text: "Valid Until",
                      color: AppTheme.whiteColor,
                      fontSize: 11.sp),
                  Spacer(),
                  CommonUI().myText(
                      text: validdate!,
                      fontSize: 12.sp,
                      color: AppTheme.whiteColor),
                  //CommonUI().myText(text: '/ 15 Days',fontSize: 10.sp,color: AppTheme.whiteColor),
                ],
              ),
              Gap(1.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeave(BuildContext context){

    return
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(1.h),
          leavedata.isNotEmpty
          ?
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: leavedata.length,
              itemBuilder: (context,index){
                var item=leavedata[index];
                print("item.leaveType");
                print(item.leaveType);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.whiteColor,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          // spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0,0), // changes the position of the shadow
                        ),
                      ],
                    ),

                    child: Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width:60.w,child: CommonUI().myText(text:item.leaveType !=null ? item.leaveType!.leaveType.toString(): "-" ,fontSize: 11.sp,fontWeight:FontWeight.w500)),
                                  Gap(1.h),
                                  Row(
                                    children: [
                                      CommonUI().myText(text: item.fromDate.toString().split(' ')[0],color: AppTheme.primaryColor2,fontSize: 11.sp,fontWeight:FontWeight.w500   ),
                                      Gap(2.w),
                                      item.toDate !=null ? CommonUI().myText(text: "to",color: AppTheme.primaryColor2,fontSize:11.sp ):SizedBox(),
                                      Gap(2.w),
                                      item.toDate !=null ? CommonUI().myText(text: item.toDate.toString().split(' ')[0],color: AppTheme.primaryColor2,fontSize: 11.sp,fontWeight: FontWeight.w500):SizedBox()
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),

                              Material(
                                elevation: 5,
                                color: Colors.transparent,
                                child: CommonUI.buttonContainer(
                                    height: 3.h,
                                    gradientfirst: AppTheme.primaryColor2,
                                    gradientsecond:AppTheme.primaryColor2 ,
                                    width: 20.w,

                                    onPressed: (){


                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveHistoryDetails(leaveID: item.id,)));
                                    }, file: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonUI().myText(text: "VIEW",color: AppTheme.whiteColor,fontSize: 9.sp)
                                  ],
                                )),
                              ),
                            ],
                          ),
                        ),

                        Gap(1.h),

                        Row(
                          children: [
                            Gap(2.w),

                            SizedBox(
                                width: 80.w,
                                child: CommonUI().myText(text:
                                item.requestType == "request" ? " ":"cancellation for this leave is requested",
                                    overflow: TextOverflow.visible,
                                    color: AppTheme.blackColor)),
                          ],
                        ),
                        Gap(1.h),
                        const Divider(
                          endIndent: 0,
                          indent: 0,
                          color: Colors.black,
                          thickness: 0.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CommonUI().myText(text: 'Applied Date',fontSize: 9.sp,fontWeight: FontWeight.w600),
                              Gap(1.w),
                              CommonUI().myText(text: item.createdAt.toString().split('T')[0],color: AppTheme.FontGrey,fontWeight: FontWeight.w500,fontSize: 9.sp),
                              Spacer(),
                              CommonUI().myText(text: 'Status',fontSize: 9.sp,fontWeight: FontWeight.w600),
                              Gap(1.w),
                              CommonUI().myText(text: item.status[0].toUpperCase() + item.status.substring(1)  ,color: AppTheme.primaryColor1,fontWeight: FontWeight.w500,fontSize: 9.sp),

                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                );


              }) : Image.asset(AppConstant.noDataIcon),
        ],
      ),
    );




  }
}
