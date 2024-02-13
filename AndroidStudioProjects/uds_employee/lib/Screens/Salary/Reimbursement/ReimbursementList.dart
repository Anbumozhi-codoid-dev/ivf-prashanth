import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uds_employee/Allnavigations/AllNavigationsDirectory.dart';

import '../../../Allnavigations/AllBlocDirectory.dart';
import '../../../Allnavigations/AllimportedDirectory.dart';
import '../../../Bloc/SalaryBloc.dart';
import 'ReimbursementDetailsPage.dart';
import 'ReimbursementForm.dart';

class ReimbursementList extends StatefulWidget {
  const ReimbursementList({super.key});

  @override
  State<ReimbursementList> createState() => _ReimbursementListState();
}

class _ReimbursementListState extends State<ReimbursementList> {
  List<ReimbursementListObject> reimbursementList = [];
  String status="0";
  // bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = SalaryBloc();
        bloc.add(GetReimbursementListEvent(context, "pending"));
        return bloc;
      },
      child: BlocListener<SalaryBloc, SalaryState>(
        listener: (context, state) {
          if (state is GetReimbursementListSuccessState) {
            print("$state");
            print(state.data['data']);
            // print(state.data['data']['data'][0]['amount']);
            var item = state.data['data']['data'];
            reimbursementList.clear();
            for(int i=0; i< item.length ; i++ ){
              reimbursementList.add(ReimbursementListObject.fromJson(state.data['data']['data'][i]));
            }


            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LeaveScreen(userId: widget.userId,)));
          }
          if (state is GetReimbursementListErrorState) {

          }
        },
        child: BlocBuilder<SalaryBloc, SalaryState>(
          builder: (context, state) {
            return Scaffold(
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
                        text: 'REIMBURSEMENT',
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
                    _buildPaySlipCard(context),
                    Gap(2.h),

                  ],
                ),
              ),
              bottomNavigationBar:  _bottomNewButton(context),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPaySlipCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(1.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonUI.buttonContainer(
                  gradientfirst:

                  status =="0" ?  AppTheme.primaryColor2 : AppTheme.whiteColor ,
                  gradientsecond:
                  status =="0" ? AppTheme.primaryColor1 : AppTheme.whiteColor,
                  height: 4.h,
                  width: 30.w,
                  onPressed: () {
                    setState(() {
                      status = "0";


                      BlocProvider.of<SalaryBloc>(context).add(GetReimbursementListEvent(context, "pending"));

                    });


                  },
                  file: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonUI().myText(
                          text: "Active",
                          color: status =="0"
                              ? AppTheme.whiteColor
                              : AppTheme.blackColor)
                    ],
                  )),
              Gap(1.w),
              CommonUI.buttonContainer(
                  gradientfirst:
                  status=="1" ? AppTheme.primaryColor2 : AppTheme.whiteColor,
                  gradientsecond:
                  status=="1" ? AppTheme.primaryColor1 : AppTheme.whiteColor,
                  height: 4.h,
                  width: 30.w,
                  onPressed: () {
                    print("isComplete pressed");
                    setState(() {
                      status = "1";
                      BlocProvider.of<SalaryBloc>(context).add(GetReimbursementListEvent(context, "approved"));

                    });

                  },
                  file: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonUI().myText(
                          text: "Completed",
                          fontSize: 10.sp,
                          color: status =="1"
                              ? AppTheme.whiteColor
                              : AppTheme.blackColor)
                    ],
                  )),
          Gap(1.w),
              CommonUI.buttonContainer(
                  gradientfirst:
                  status=="2" ? AppTheme.primaryColor2 : AppTheme.whiteColor,
                  gradientsecond:
                  status =="2" ? AppTheme.primaryColor1 : AppTheme.whiteColor,
                  height: 4.h,
                  width: 30.w,
                  onPressed: () {
                    print("isComplete pressed");
                    setState(() {
                      status = "2";
                      BlocProvider.of<SalaryBloc>(context).add(GetReimbursementListEvent(context, "declined"));

                    });

                  },
                  file: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonUI().myText(
                          text: "Decline",
                          fontSize: 10.sp,
                          color: status=="2"
                              ? AppTheme.whiteColor
                              : AppTheme.blackColor)
                    ],
                  )),
            ],
          ),
          Gap(2.h),
          reimbursementList.isNotEmpty
          ?
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: reimbursementList.length,
              itemBuilder: (context, index) {
                // var items=leavedata[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: AppTheme.whiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          // spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(
                              0, 0), // changes the position of the shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: AppTheme.primaryColor2,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              )),
                          height: 5.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                reimbursementList[index].reasonType =="stay"?
                                Image.asset(AppConstant.stayIcon):
                                reimbursementList[index].reasonType == "travel"?
                                Image.asset(AppConstant.travelIcon):
                                reimbursementList[index].reasonType == "Fuel"?
                                Icon(Icons.emoji_transportation_rounded, color: AppTheme.whiteColor,):
                                    reimbursementList[index].reasonType == "Food" ?
                                        Image.asset(AppConstant.foodIcon):
                                    SizedBox()


                                ,
                                Gap(2.w),
                                CommonUI().myText(
                                    text: reimbursementList[index].reasonType,
                                    fontSize: 15.sp,
                                    color: AppTheme.whiteColor),
                                Gap(35.w),
                                Image.asset(AppConstant.calenderIcon),
                                Gap(2.w),
                                CommonUI().myText(
                                    text: reimbursementList[index].forDate!,
                                    color: AppTheme.whiteColor),
                              ],
                            ),
                          ),
                        ),
                        Gap(3.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Gap(3.w),
                            Image.asset(
                              AppConstant.rupeeIcon,
                              scale: 4,
                            ),
                            Gap(1.w),
                            CommonUI().myText(text: reimbursementList[index].amount),
                            CommonUI().myText(text: "/-"),
                           Spacer(),
                            GestureDetector(
                              onTap: (){
                                print("${ reimbursementList[index].id} reim id");
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                ReimbursementDetails( reimbursementID: reimbursementList[index].id,)));
                              },
                              child: CommonUI().myText(
                                  text: "View Details",
                                  color: AppTheme.primaryColor2),
                            ),
                            Gap(3.w),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
              :
          Column(
            children: [
              Image.asset(AppConstant.noDataIcon),
              CommonUI().myText(text: "No Data Found")
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomNewButton(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(2.w,1.h,2.w,2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonUI.buttonContainer(
              height: 4.h,
              width: 35.w,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReimbursementForm()));
              },
              file: Center(
                  child: CommonUI()
                      .myText(text: "APPLY", color: AppTheme.whiteColor))),
          Gap(4.w),
        ],
      ),
    );
  }
}
