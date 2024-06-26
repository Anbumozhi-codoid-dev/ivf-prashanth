

import 'package:flutter/cupertino.dart';

import '../../Utils/AllImports.dart';
import '../SingupPage/SignupPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return 
      SafeArea(
        child: Scaffold(
        
        body: Container(
          height: 100.h,
          child: Column(
            children: [
              Container(
                width: 120.w,
                height: 50.h,
                // color: Colors.blue,
                child: Image.asset(AppConstants.welcomeHand, scale: 1,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                height: 45.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  color: AppTheme.themePink,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(90),
                  topRight: Radius.circular(90),

                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(6.h),
                    CommonUI().myText(text: "Everything will be fine,",
                    color: AppTheme.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700),
                    CommonUI().myText(text: " Don’t give up on hope.",
                    color: AppTheme.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700),
                    Gap(2.h),
                    Divider(
                      endIndent: 10.w,
                    indent: 10.w,),
                    Gap(2.h),
                    CommonUI().myText(text: "Start your IVF Journey today with \n      Prashanth Fertility App",
                    color: AppTheme.white,
                    fontSize: 15.sp,
                    ),

                    Gap(2.h),
                    GestureDetector(
                      onTap: (){
                        print("ontap");
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> LoginScreen())
                        );
                      },
                      child: CommonUI().buttonContainer(
                        height: 5.h,
                        width: 70.w,
                        color: AppTheme.white,
                        child: Center(child: CommonUI().myText(text: "Login",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPink))
                      ),
                    ),
                    Gap(2.h),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            SignUpPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Gap(18.w),
                          CommonUI().myText(text: "Are you an New User?",
                            fontSize: 11.sp,
                            color: AppTheme.white,
                          ),
                          // Gap(2.w),
                          CommonUI().myText(text: "Register",
                            fontSize: 11.sp,
                            color: AppTheme.white,
                            fontWeight: FontWeight.w600
                          ),
                          Gap(18.w)
                        ],
                      ),
                    ),
                    Gap(3.h)

                  ],
                ),
              )
            ],
          ),
        ),
            ),
      );
  }
}
