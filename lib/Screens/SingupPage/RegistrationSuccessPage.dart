import '../../Utils/AllImports.dart';

class RegistrationSuccess extends StatefulWidget {
  const RegistrationSuccess({super.key});

  @override
  State<RegistrationSuccess> createState() => _RegistrationSuccessState();
}

class _RegistrationSuccessState extends State<RegistrationSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [Container(
          height: 12.h,
          width: 100.w,
          decoration: const BoxDecoration(
              color: AppTheme.themePink,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100))),
          child: Center(
            child: CommonUI().myText(
                text: "Patient Details",
                color: AppTheme.white,
                fontSize: 20.sp,
                fontfamily: "Nunito",
                fontWeight: FontWeight.w700),
          ),
        ),
          Gap(20.h),
          Container(
            child: Image.asset(AppConstants.tick_Icon, scale: 4,),
          ),
          Gap(4.h),
          CommonUI().myText(text: "Successfully Registered !",color: AppTheme.textPink,
          fontfamily: "Nunito",
            fontSize: 22.sp,
            fontWeight: FontWeight.w700
          ),
          Gap(15.h),

        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoardScreen(index: 0,)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonUI().buttonContainer(
                height: 7.h,
                width: 85.w,
                color: AppTheme.themePink,
                child: Center(
                  child: CommonUI().myText(text: "Done", color: AppTheme.white,
                      fontSize: 16.sp,fontWeight: FontWeight.w600),
                )
            ),
          ],
        ),
      )
      ,
    );
  }
}
