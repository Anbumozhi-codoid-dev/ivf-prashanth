

import '../../Repository/ApiObjectRepository.dart';
import '../../Utils/AllImports.dart';
import '../../Utils/DeviceTab.dart';
import '../Home/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isSendOtp = false;
  bool isVerifyOtp = false;

  TextEditingController? otpTextEditingController = TextEditingController();
  TextEditingController? CoupleIDController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  // StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  String? mobileNumber = "9847562378";
  final loginFormKey = GlobalKey<FormState>();

  void toggleOTPField() {
    if (loginFormKey.currentState?.validate() ?? false) {
      setState(() {
        isVerifyOtp = !isVerifyOtp;
        if (isVerifyOtp) {
          otpTextEditingController = TextEditingController();
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
        } else {
          otpTextEditingController?.dispose();
          otpTextEditingController = null;
        }
      });
    } else {
      // ToastContext().init(context);
      // Toast.show(
      //     "Please enter valid coupleId",
      //     backgroundColor: AppTheme.primaryColor2,
      //     duration: Toast.lengthLong,
      //     gravity: Toast.bottom);
    }
  }  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isSendOtp = false;
      isVerifyOtp = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    bool isTablet = isTabletDevice(context); // Use the utility function
    return
      SafeArea(
      child: Scaffold(
        //
        // appBar: AppBar(
        //   actions: [
        //     Container(
        //       color: Colors.red,
        //     )
        //   ],
        // ),
        body:
        SingleChildScrollView(
          child: Form(
            key: loginFormKey,

            child: Column(
              children: [

                Container(
                  height: 15.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    color: AppTheme.themePink,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)
                    )
                  ),
                  child: Center(
                    child: CommonUI().myText(text: "Login",
                      color: AppTheme.white,
                      fontSize: 20.sp,
                      fontfamily: "Nunito",
                      fontWeight: FontWeight.w700
                    ),
                  ),

                ),
                Container(
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(6.w,5.h,8.w,0),
                    child: Column(
                      children: [

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonUI().myText(text: "Welcome !",fontWeight: FontWeight.w700,
                                color: AppTheme.themePink,
                                fontSize: isTablet ? 19.sp : 23.sp
                            ),
                          ],
                        ),
                        Gap(2.h),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonUI().myText(text: "Enter your Couple ID to Sign in",fontWeight: FontWeight.w300,
                                color: AppTheme.themePink,
                                fontSize: 13.sp,

                            ),
                          ],
                        ),
                        Gap(2.h),

                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              CommonUI().myText(text: "Couple ID",fontWeight: FontWeight.w500,
                                  color: AppTheme.black,
                                  fontSize: 13.sp
                              ),
                              Gap(3.h),
                              CommonUI().formFields(
                                enabled: true,
                                  fontsize: 14.sp,
                                  fontfamily: "Nunito",

                                  height: 10.h,
                                  width: 80.w,
                                  controller: CoupleIDController!,
                                  hintText: "enter couple ID",
                                  hintfontsize: 14.sp,
                                validator: (value) {
                                  if (value == null || value.isEmpty || value.length < 5) {
                                    return 'Please enter a valid couple ID';
                                  }
                                  return null;
                                },

                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Gap(4.h),
                isVerifyOtp?

                Padding(
                  padding:  EdgeInsets.fromLTRB(6.w,3.h,8.w,0),
                  child: Row(
                    children: [
                      CommonUI().myText(text: "Enter the OTP sent to ",

                      fontSize: isTablet ? 13.sp : 10.sp ),
                      CommonUI().myText(text: "+91 ${mobileNumber!.substring(0,5)}XXXXX",
                          fontSize: isTablet ? 9.sp : 7.sp,
                          color: AppTheme.themePink ),
                    ],
                  ),
                )
                :
                SizedBox(),
                Gap(2.h),
               isVerifyOtp?
               // Form(
               //    key: GlobalKey<FormState>(),
               //    // key: formKey,
               //    child: Padding(
               //      padding:
               //      // const EdgeInsets.symmetric(
               //      //   vertical: 8.0,
               //      //   horizontal: 30,
               //      // ),
               //      EdgeInsets.fromLTRB(6.w,0,8.w,0),
               //      child: PinCodeTextField(
               //        appContext: context,
               //        pastedTextStyle: TextStyle(
               //          color: Colors.transparent,
               //          // color: Colors.green.shade600,
               //          fontWeight: FontWeight.bold,
               //        ),
               //        length: 5,
               //        obscureText: true,
               //        obscuringCharacter: '*',
               //        // obscuringWidget: const FlutterLogo(
               //        //   size: 24,
               //        // ),
               //        blinkWhenObscuring: true,
               //        animationType: AnimationType.fade,
               //        validator: (v) {
               //          if (v!.length < 5) {
               //            return "I'm from validator";
               //          } else {
               //            return null;
               //          }
               //        },
               //        pinTheme: PinTheme(
               //          shape: PinCodeFieldShape.box,
               //          borderRadius: BorderRadius.circular(9.5),
               //          fieldHeight: 49,
               //          fieldWidth: 48,
               //
               //          //   inactiveBorderWidth: 0,
               //          // activeBorderWidth: 0,
               //          // inactiveFillColor: AppTheme.formFieldGrey
               //          inactiveColor: Colors.transparent, // Inactive border color
               //          inactiveFillColor: AppTheme.formFieldGrey, // Inactive fill color
               //          selectedColor: Colors.transparent, // Selected border color
               //          selectedFillColor: AppTheme.formFieldGrey, // Selected fill color
               //          activeColor: Colors.transparent, // Active border color
               //          activeFillColor: AppTheme.formFieldGrey, // Active fill color
               //          errorBorderColor: Colors.transparent, // Error border color
               //          disabledColor: Colors.transparent,
               //        ),
               //        cursorColor: Colors.black,
               //        animationDuration: const Duration(milliseconds: 300),
               //        enableActiveFill: true,
               //        // errorAnimationController: errorController,
               //        controller: otpTextEditingController,
               //        keyboardType: TextInputType.number,
               //        // boxShadows: const [
               //        //   BoxShadow(
               //        //     offset: Offset(0, 1),
               //        //     color: Colors.black12,
               //        //     blurRadius: 10,
               //        //   )
               //        // ],
               //        onCompleted: (v) {
               //          debugPrint("Completed");
               //          print(v);
               //        },
               //        // onTap: () {
               //        //   print("Pressed");
               //        // },
               //        onChanged: (value) {
               //          debugPrint(value);
               //          setState(() {
               //            currentText = value;
               //            print("currentText===");
               //            print(currentText);
               //          });
               //        },
               //        beforeTextPaste: (text) {
               //          debugPrint("Allowing to paste $text");
               //          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
               //          //but you can show anything you want here, like your pop up saying wrong paste format or etc
               //          return true;
               //        },
               //      ),
               //    ),
               //  )
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 3.w),
                 child: PinCodeTextField(
                   appContext: context,
                   pastedTextStyle: TextStyle(
                     color: Colors.transparent,
                     fontWeight: FontWeight.bold,
                   ),
                   length: 5,
                   obscureText: true,
                   obscuringCharacter: '*',
                   // obscuringWidget: const FlutterLogo(
                   //   size: 24,
                   // ),
                   blinkWhenObscuring: true,
                   animationType: AnimationType.fade,
                   validator: (v) {
                     if (v == null || v.isEmpty || v.length < 3) {
                       return "Please enter a valid OTP";
                     } else {
                       return null;
                     }
                   },
                   pinTheme: PinTheme(
                     shape: PinCodeFieldShape.box,
                     borderRadius: BorderRadius.circular(15),
                     fieldHeight:  isTablet ? 10.h : 45,
                     fieldWidth: isTablet ? 10.h : 48,
                     inactiveColor: Colors.transparent, // Inactive border color
                              inactiveFillColor: AppTheme.formFieldGrey, // Inactive fill color
                              selectedColor: Colors.transparent, // Selected border color
                              selectedFillColor: AppTheme.formFieldGrey, // Selected fill color
                              activeColor: Colors.transparent, // Active border color
                              activeFillColor: AppTheme.formFieldGrey, // Active fill color
                              errorBorderColor: Colors.transparent, // Error border color
                              disabledColor: Colors.transparent,
                   ),
                   cursorColor: Colors.black,
                   animationDuration: const Duration(milliseconds: 300),
                   enableActiveFill: true,
                   // errorAnimationController: errorController,
                   controller: otpTextEditingController,
                   keyboardType: TextInputType.number,
                   onCompleted: (v) {
                     debugPrint("Completed");
                   },
                   onChanged: (value) {
                     debugPrint(value);
                   },
                   beforeTextPaste: (text) {
                     debugPrint("Allowing to paste $text");
                     return true;
                   },
                 ),
               )
                :SizedBox()
                ,

                isVerifyOtp ?
            Padding(
                  padding:  EdgeInsets.fromLTRB(6.w,1.h,4.w,0),
                  child: Row(
                    children: [
                      CommonUI().myText(text: "Haven’t Received the OTP Yet? ",
                      fontSize: 12.sp, fontWeight: FontWeight.w400),
                      CommonUI().myText(text: "Resend OTP", color: AppTheme.textPink,
                          fontSize: 12.sp, fontWeight: FontWeight.w400),
                    ],
                  ),
                )
                :SizedBox()

              ],
            ),
          ),
        ),

        bottomNavigationBar:
          Container(
            height:  isTablet ? 13.h : 10.h,
            child: Column(
              children: [
            isVerifyOtp?

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    GestureDetector(
                      onTap:(){
                        if(loginFormKey.currentState?.validate() ?? true){
                          CoupleIdVerifyObject otpdata = CoupleIdVerifyObject(
                            coupleId: CoupleIDController!.text.trim(), id: "userID", otp: otpTextEditingController!.text,

                          );
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoardScreen(index: 0,)));

                        }
       },
                      // toggleOTPField,
                      //     (){
                      //   setState(() {
                      //     // isSendOtp = !isSendOtp;
                      //     print("CoupleIDController.text");
                      //     print(CoupleIDController?.text.trim());
                      //     print(CoupleIDController!.text.trim().isNotEmpty);
                      //     print(CoupleIDController?.text.trim() != null);
                      //     print(CoupleIDController?.text.trim() != " ");
                      //
                      //     if( CoupleIDController!.text.trim().isNotEmpty && CoupleIDController!.text.length >5 ){
                      //       isVerifyOtp = !isVerifyOtp;
                      //
                      //
                      //       if(isVerifyOtp){
                      //         setState(() {
                      //           otpTextEditingController = TextEditingController();
                      //
                      //         });
                      //         // otpTextEditingController = " ";
                      //       }
                      //       else{
                      //         otpTextEditingController?.dispose();
                      //         otpTextEditingController = null;
                      //       }
                      //     }
                      //     else{
                      //
                      //       setState(() {
                      //         otpTextEditingController?.dispose();
                      //         otpTextEditingController = null;
                      //
                      //       });
                      //        ToastContext().init(context);
                      //       Toast.show(
                      //           "Please enter valid couple Id",
                      //           backgroundColor: AppTheme.themePink,
                      //           duration: Toast.lengthLong,
                      //           gravity: Toast.bottom);
                      //
                      //     }
                      //
                      //
                      //   });
                      //   print("isVerifyOtp");
                      //   print(isVerifyOtp);
                      // },
                      child:
                      CommonUI().buttonContainer(
                          height: 5.h,
                          width: 80.w,
                          color:
                          CoupleIDController?.text != null || CoupleIDController?.text != "" ?

                          AppTheme.themePink
                          :
                          AppTheme.formFieldGrey,
                          child: Center(
                            child:
                           // isVerifyOtp?
                           // CommonUI().myText(
                           //      text: "Verify", color: AppTheme.white,
                           //      fontSize: 15.sp
                           //
                           //  )
                           //    :
                            CommonUI().myText(
                                text: "Verify", color:
                            CoupleIDController?.text != null || CoupleIDController?.text != "" ?

                            AppTheme.white
                                :
                                AppTheme.black,
                                fontSize: 15.sp

                            ),
                          )
                      ),
                    ),
                  ],
                )
                :
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              GestureDetector(
                onTap:toggleOTPField,
                //     (){
                //   setState(() {
                //     // isSendOtp = !isSendOtp;
                //     print("CoupleIDController.text");
                //     print(CoupleIDController?.text.trim());
                //     print(CoupleIDController!.text.trim().isNotEmpty);
                //     print(CoupleIDController?.text.trim() != null);
                //     print(CoupleIDController?.text.trim() != " ");
                //
                //     if( CoupleIDController!.text.trim().isNotEmpty && CoupleIDController!.text.length >5 ){
                //       isVerifyOtp = !isVerifyOtp;
                //
                //
                //       if(isVerifyOtp){
                //         setState(() {
                //           otpTextEditingController = TextEditingController();
                //
                //         });
                //         // otpTextEditingController = " ";
                //       }
                //       else{
                //         otpTextEditingController?.dispose();
                //         otpTextEditingController = null;
                //       }
                //     }
                //     else{
                //
                //       setState(() {
                //         otpTextEditingController?.dispose();
                //         otpTextEditingController = null;
                //
                //       });
                //        ToastContext().init(context);
                //       Toast.show(
                //           "Please enter valid couple Id",
                //           backgroundColor: AppTheme.themePink,
                //           duration: Toast.lengthLong,
                //           gravity: Toast.bottom);
                //
                //     }
                //
                //
                //   });
                //   print("isVerifyOtp");
                //   print(isVerifyOtp);
                // },
                child:
                CommonUI().buttonContainer(
                    height: 5.h,
                    width: 80.w,
                    color:
                    CoupleIDController?.text != null || CoupleIDController?.text != "" ?

                    AppTheme.themePink
                        :
                    AppTheme.formFieldGrey,
                    child: Center(
                      child:

                      CommonUI().myText(
                          text: "Send OTP", color:
                      CoupleIDController?.text != null || CoupleIDController?.text != "" ?

                      AppTheme.white
                          :
                      AppTheme.black,
                          fontSize: 15.sp

                      ),



                    )
                ),
              ),
            ],
          )
                ,
                Gap(1.h),
            isVerifyOtp?
            Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonUI().myText(text: "Having Trouble Logging In? ",
                        fontSize: 12.sp, fontWeight: FontWeight.w400),
                    CommonUI().myText(text: "Contact Us ", color: AppTheme.textPink,
                        fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ],
                )
                : SizedBox()
              ],
            ),
          )



      ),
    );
  }
  @override
  void dispose() {
    // errorController?.dispose();
    otpTextEditingController?.dispose();
    super.dispose();
  }

}



// isVerifyOtp
//     ?
//
//
//
// Column(
//   children: [
//     Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: (){
//             setState(() {
//               // isSendOtp = !isSendOtp;
//
//             });
//             print("isSendOtp");
//             print(isSendOtp);
//           },
//           child: CommonUI().buttonContainer(
//               height: 5.h,
//               width: 80.w,
//               color: AppTheme.themePink,
//               child: Center(
//                 child: CommonUI().myText(
//                     text: "Verify", color: AppTheme.white,
//                     fontSize: 15.sp
//
//                 ),
//               )
//           ),
//         ),
//       ],
//     ),
//     Gap(2.h),
//     Padding(
//       padding:  EdgeInsets.fromLTRB(6.w,5.h,4.w,0),
//       child: Row(
//         children: [
//           CommonUI().myText(text: "Having Trouble Logging In? ",
//               fontSize: 12.sp, fontWeight: FontWeight.w400),
//           CommonUI().myText(text: "Contact Us ", color: AppTheme.textPink,
//               fontSize: 12.sp, fontWeight: FontWeight.w400),
//         ],
//       ),
//     )
//   ],
// )
//     :
