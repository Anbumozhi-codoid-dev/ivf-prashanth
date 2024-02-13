import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uds_employee/Allnavigations/AllNavigationsDirectory.dart';
import 'package:uds_employee/Allnavigations/AllimportedDirectory.dart';

import '../../../Allnavigations/AllBlocDirectory.dart';
import '../../../Bloc/PermissionBloc.dart';
import 'PermissionDetails.dart';

class PermissionHistory extends StatefulWidget {
   PermissionHistory({Key? key,required this.userId}) : super(key: key);
   String userId;

  @override
  State<PermissionHistory> createState() => _PermissionHistoryState();
}

class _PermissionHistoryState extends State<PermissionHistory> {
  List<PermissionData>  _permissionData=[];




  String formatDuration(String fromtime,String outtime) {
    DateTime startTime = DateFormat("HH:mm:ss").parse(fromtime);
    DateTime endTime = DateFormat("HH:mm:ss").parse(outtime);

    // Calculate the time difference
    Duration difference = endTime.difference(startTime);
    int hours = difference.inHours;
    int minutes = difference.inMinutes % 60;

    if (hours > 0 && minutes > 0) {
      return '$hours hour $minutes minutes';
    } else if (hours > 0) {
      return '$hours hour';
    } else {
      return '$minutes minutes';
    }
  }
  @override
  Widget build(BuildContext context) {
    return

    BlocProvider(create: (context){
      var bloc=PermissionBloc();
      bloc.add(PermissionHistoryEvent("approved", widget.userId, context));
      return bloc;
    },
      child: BlocListener<PermissionBloc,PermissionState>(
        listener: (context,state){
          if(state is PermissionHistorySuccessState ){
          var data=state.data['data']['data'];
          for(int i=0;i<data.length;i++){
          _permissionData.add(PermissionData.fromJson(data[i]));
          }

          }
        },
        child: BlocBuilder<PermissionBloc,PermissionState>(
          builder: (context,state){
            return
            state is PermissionHistorySuccessState
              ?

              Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: AppTheme.whiteColor,
                title: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                    Gap(2.h),
                    CommonUI().myText(text: "PERMISSION HISTORY")
                  ],
                ),
              ),
              body:SingleChildScrollView(
                child: Column(
                  children: [

                    _buildpermission(context),
                    Gap(5.h),
                    Row(
                      children: [
                        Spacer(),

                        Material(
                          elevation: 5,
                          color: Colors.transparent,
                          child: CommonUI.buttonContainer(
                              height: 4.h,
                              width: 30.w,
                              gradientfirst: AppTheme.buttonColor,
                              gradientsecond: AppTheme.buttonColor,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CalenderScreen(value: 'Permission')));
                              }, file: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonUI().myText(text: "APPLY",color: AppTheme.whiteColor,fontSize: 10.sp)

                            ],)),
                        ),
                        Gap(2.h),

                      ],
                    ),

                  ],
                ),
              ),

            )
                : _buildShimmer(context)
            ;
          },
        ),
      ),
    );



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





  Widget _buildpermission(BuildContext context){

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonUI().myText(text: "Completed"),
          Gap(1.h),
          _permissionData.isNotEmpty
          ?
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _permissionData.length,
              itemBuilder: (context,index){
                var items=_permissionData[index];
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
                                  CommonUI().myText(text: formatDuration(items.fromTime,items.toTime),fontSize: 11.sp,fontWeight:FontWeight.w500),
                                  Gap(1.h),
                                  CommonUI().myText(text:items.forDate.toString().split(' ')[0],color: AppTheme.primaryColor2,fontSize: 11.sp,fontWeight:FontWeight.w500   ),

                                ],
                              ),
                              Spacer(),

                              Material(
                                elevation: 5,
                                color: Colors.transparent,
                                child: CommonUI.buttonContainer(
                                    height: 3.h,
                                    gradientfirst: AppTheme.primaryColor2,
                                    gradientsecond:AppTheme.primaryColor2 ,
                                    width: 20.w,

                                    onPressed: (){

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PermissionDetailsScreen(PermissionId: items.id,)));
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
                              CommonUI().myText(text: items.createdAt.toString().split('T')[0],color: AppTheme.FontGrey,fontWeight: FontWeight.w500,fontSize: 9.sp),
                              Spacer(),
                              CommonUI().myText(text: 'Status',fontSize: 9.sp,fontWeight: FontWeight.w600),
                              Gap(1.w),
                              CommonUI().myText(text: items.status,color: AppTheme.presentColor,fontWeight: FontWeight.w500,fontSize: 9.sp),

                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                );


              }):
          Column(
            children: [
              Image.asset(AppConstant.noDataIcon),
              CommonUI().myText(text: "No Permission History Record")
            ],
          ),
        ],
      ),
    );
  }
}
