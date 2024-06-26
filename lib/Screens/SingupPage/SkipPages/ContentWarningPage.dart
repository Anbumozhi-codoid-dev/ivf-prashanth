import '../../../Utils/AllImports.dart';

class ContentWarningPage extends StatefulWidget {
  const ContentWarningPage({super.key});

  @override
  State<ContentWarningPage> createState() => _ContentWarningPageState();
}

class _ContentWarningPageState extends State<ContentWarningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(

        child: Container(
          height: 70.h,
          width: 100.w,
          child: Padding(
            padding:  EdgeInsets.fromLTRB(3.w,0,3.w,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(10.h),
                Image.asset(AppConstants.warningIcon, scale: 5,),
                Gap(4.h),
                CommonUI().myText(text: "Content Warning",
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                fontfamily: "Nunito"),
                Gap(7.h),
                CommonUI().myText(text: "The Next question mentions IVF, ICSI, IUI",
                fontWeight: FontWeight.w500,
                maxLines: 3,
                fontSize: 14.sp,
                textAlign: TextAlign.center,
                color: AppTheme.fontGrey,
                fontfamily: "Nunito"),
                CommonUI().myText(text: " loss and termination which we know can ",
                fontWeight: FontWeight.w500,
                maxLines: 3,
                fontSize: 14.sp,
                textAlign: TextAlign.center,
                color: AppTheme.fontGrey,
                fontfamily: "Nunito"),
                CommonUI().myText(text: "be emotional to talk about",
                fontWeight: FontWeight.w500,
                maxLines: 3,
                fontSize: 14.sp,
                textAlign: TextAlign.center,
                color: AppTheme.fontGrey,
                fontfamily: "Nunito"),

                Gap(5.h),
                CommonUI().myText(text: "You can answer it or skip to the next question",
                fontWeight: FontWeight.w500,
                maxLines: 3,
                fontSize: 13.sp,
                textAlign: TextAlign.center,
                color: AppTheme.fontGrey,
                fontfamily: "Nunito"),

                CommonUI().myText(text: "it’s your choice",
                fontWeight: FontWeight.w500,
                maxLines: 3,
                fontSize: 14.sp,
                textAlign: TextAlign.center,
                color: AppTheme.fontGrey,
                fontfamily: "Nunito"),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashboardScreen()));
            },
            child: CommonUI().myText(text: "Skip",color: AppTheme.textPink,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600),
          ),
          Gap(50.w),
          GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PatientDetailForm()));
              },
              child: Image.asset(AppConstants.circleArrowIcon, scale: 4.5,))
        ],
      ),
    );
  }
}
