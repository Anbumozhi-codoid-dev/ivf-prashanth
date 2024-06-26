import 'dart:async';

import 'package:ivf/Screens/SingupPage/SignUpFormPage.dart';

import '../../Utils/AllImports.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isSendOtp1 = false;
  bool isVerifyOtp1 = false;

  TextEditingController? otpTextEditingController1 = TextEditingController();
  TextEditingController? mobileNumberController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  String? mobileNumber = "9847562378";
  final formKey = GlobalKey<FormState>();

  void toggleOTPField() {
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        isVerifyOtp1 = !isVerifyOtp1;
        if (isVerifyOtp1) {
          setState(() {
            otpTextEditingController1 = TextEditingController();

          });
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
        } else {
          otpTextEditingController1?.dispose();
          otpTextEditingController1 = null;
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
      isSendOtp1 = false;
      isVerifyOtp1 = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          //
          appBar: AppBar(

backgroundColor: AppTheme.themePink,
            centerTitle: true,
            automaticallyImplyLeading: false,

            toolbarHeight: 20.h,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
              //  Radius.circular(12.h)
                 bottomRight: Radius.circular(12.h),
                 bottomLeft: Radius.circular(12.h),
              ),
            ),
            bottom: const PreferredSize(
                preferredSize:
                Size.fromHeight(2.0), // Set the height of the border line
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Divider(
                    thickness: 1.0,
                    height: 1,
                    color: AppTheme.white,
                  ),
                )),
            title: CommonUI().myText(text: "Sign up",color: AppTheme.white,fontSize: 20.sp,fontWeight: FontWeight.w700),
          ),
            body:
            SingleChildScrollView(
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
                      child: CommonUI().myText(text: "Sign up",
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
                                  fontSize: 23.sp
                              ),
                            ],
                          ),
                          Gap(2.h),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonUI().myText(text: "Enter your phone number to register",fontWeight: FontWeight.w300,
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
                                CommonUI().myText(text: "Mobile Number",fontWeight: FontWeight.w500,
                                    color: AppTheme.black,
                                    fontSize: 13.sp
                                ),
                                Gap(3.h),
                                Form(
                                  key: formKey,
                                  child: CommonUI().textFormField(
                                    enabled: true,
                                    fontsize: 14.sp,
                                    fontfamily: "Nunito",
                                    height: 5.h,
                                    width: 80.w,
                                    maxLength: 10,
                                    keyboardType: TextInputType.number,
                                    controller: mobileNumberController,
                                    hintText: "enter mobile number",
                                    hintfontsize: 14.sp,
                                    show: false,
                                    validator: (value) {
                                      if (value == null || value.isEmpty || value.length < 5) {
                                        return 'Please enter a valid mobile number';
                                      }
                                      return null;
                                    },

                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Gap(4.h),
                  isVerifyOtp1?

                  Padding(
                    padding:  EdgeInsets.fromLTRB(6.w,3.h,8.w,0),
                    child: Row(
                      children: [
                        CommonUI().myText(text: "Enter the OTP sent to "),
                        CommonUI().myText(text: "+91 ${mobileNumber!.substring(0,5)}XXXXX", color: AppTheme.themePink ),
                      ],
                    ),
                  )
                      :
                  SizedBox(),
                  Gap(2.h),
                  isVerifyOtp1?
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
                  Form(
                    key: GlobalKey<FormState>(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                          if (v!.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(15),
                          fieldHeight: 45,
                          fieldWidth: 48,
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
                        errorAnimationController: errorController,
                        controller: otpTextEditingController1,
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
                    ),
                  )
                      :SizedBox()
                  ,

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      hasError ? "*Please fill up otp field properly" : "",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  isVerifyOtp1 ?
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

            bottomNavigationBar:
            Container(
              height: 10.h,
              child: Column(
                children: [
                  isVerifyOtp1?

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap:(){

                          if(otpTextEditingController1!.text.isEmpty){
                            errorController?.add(ErrorAnimationType
                                .shake); // Triggering error shake animation
                            setState(() => hasError = true);
                          }
                          else{
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SingupForm()));

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
                            mobileNumberController?.text != null || mobileNumberController?.text != "" ?

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
                              mobileNumberController?.text != null || mobileNumberController?.text != "" ?

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
                            mobileNumberController?.text != null || mobileNumberController?.text != "" ?

                            AppTheme.themePink
                                :
                            AppTheme.formFieldGrey,
                            child: Center(
                              child:

                              CommonUI().myText(
                                  text: "Send OTP", color:
                              mobileNumberController?.text != null || mobileNumberController?.text != "" ?

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
                  isVerifyOtp1?
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
    otpTextEditingController1?.dispose();
    super.dispose();
  }
}
