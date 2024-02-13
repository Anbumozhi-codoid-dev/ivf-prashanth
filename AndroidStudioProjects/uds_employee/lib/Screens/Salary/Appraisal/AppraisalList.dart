import 'package:sizer/sizer.dart';

import '../../../Allnavigations/AllBlocDirectory.dart';
import '../../../Allnavigations/AllimportedDirectory.dart';
import '../../../Utils/AppConstant.dart';
import '../../../Utils/AppTheme.dart';
import '../../../Utils/CommonUI.dart';
import 'NewAppraisal.dart';

class AppraisalList extends StatefulWidget {
  const AppraisalList({super.key});

  @override
  State<AppraisalList> createState() => _AppraisalListState();
}

class _AppraisalListState extends State<AppraisalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                text: 'APPRAISAL',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children:[
                Gap(3.w),
                CommonUI().myText(text: "Last Appraisal"),
            ]
            ),

            Gap(2.h),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context,index){
                  // var items=leavedata[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 15.h,
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.circular(10.0),
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

                          Container(
                            decoration: const BoxDecoration(
                                color: AppTheme.primaryColor2,

                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                )
                            ),
                            height: 6.h,

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(

                                children: [

                                  Gap(2.w),
                                  CommonUI().myText(text: "Appraisal Date", color: AppTheme.whiteColor),
                                  Gap(25.w),
                                  Image.asset(AppConstant.calenderIcon),
                                  Gap(2.w),
                                  CommonUI().myText(text: "04-11-2023",

                                      fontSize: 10.sp,color: AppTheme.whiteColor),



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

                              Image.asset(AppConstant.rupeeIcon, scale: 4,),
                              Gap(1.w),
                              CommonUI().myText(text: "500"),
                              CommonUI().myText(text: "/-"),

                              Gap(10.w),
                              Gap(10.w),
                              Gap(20.w),
                              CommonUI().myText(text: "View Details", color: AppTheme.primaryColor2),
                              Gap(3.w),



                            ],
                          )


                        ],
                      ),
                    ),
                  );


                }),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonUI.buttonContainer(
                  height: 5.h,
                    width: 26.w,

                    onPressed:(){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context)=> NewAppraisal())
                    );

                    }, file: Center(child: CommonUI().myText(text: "APPLY",
                    fontSize: 12.sp,
                    color: AppTheme.whiteColor))),
                Gap(2.w)

              ],
            )
          ],
        ),
      ),
    );
  }
}
