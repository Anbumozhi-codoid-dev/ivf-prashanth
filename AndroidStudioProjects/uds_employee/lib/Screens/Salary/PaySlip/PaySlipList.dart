import '../../../Allnavigations/AllBlocDirectory.dart';
import '../../../Allnavigations/AllimportedDirectory.dart';
import '../../../Utils/AppTheme.dart';
import '../../../Utils/CommonUI.dart';

class PaySlipListPage extends StatefulWidget {
  const PaySlipListPage({super.key});

  @override
  State<PaySlipListPage> createState() => _PaySlipListPageState();
}

class _PaySlipListPageState extends State<PaySlipListPage> {
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
                text: 'PAY SLIP',
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
            _buildPaySlipCard(context)

          ],

        ),
      ),
    );
  }


  Widget _buildPaySlipCard(BuildContext context){

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              CommonUI.buttonContainer(
                  height: 4.h,
                  width: 26.w,
                  onPressed: (){

              }, file:  Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(2.w),
                  CommonUI().myText(text: "2023", color: AppTheme.whiteColor),
                   Icon(Icons.arrow_drop_down,
                    size: 25.sp,
                    color: AppTheme.whiteColor,)
                ],
              )),
            ],
          ),
          Gap(1.h),
          // leavedata.isNotEmpty
          //     ?
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context,index){
                // var items=leavedata[index];
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
                                  Gap(2.h),

                                  CommonUI().myText(text: "OCTOBER",fontSize: 11.sp,fontWeight:FontWeight.w500),
                                  Gap(1.h),

                                ],
                              ),
                              Spacer(),

                              Material(
                                elevation: 5,
                                color: Colors.transparent,
                                child: CommonUI.buttonContainer(
                                    height: 4.h,
                                    gradientfirst: AppTheme.primaryColor2,
                                    gradientsecond:AppTheme.primaryColor2 ,
                                    width: 25.w,

                                    onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> LeaveHistoryDetails(leaveID:items.id ,)));
                                    }, file: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonUI().myText(text: "DOWNLOAD",color: AppTheme.whiteColor,fontSize: 9.sp)
                                  ],
                                )),
                              ),
                              Gap(2.w),
                              Material(
                                elevation: 5,
                                color: Colors.transparent,
                                child: CommonUI.buttonContainer(
                                    height: 4.h,
                                    gradientfirst: AppTheme.primaryColor2,
                                    gradientsecond:AppTheme.primaryColor2 ,
                                    width: 22.w,

                                    onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> LeaveHistoryDetails(leaveID:items.id ,)));
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


                      ],
                    ),
                  ),
                );


              })
          //     :
          // Image.asset(AppConstant.noDataIcon),
        ],
      ),
    );
  }

}
