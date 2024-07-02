import 'package:flutter/cupertino.dart';

import '../../Utils/AllImports.dart';
import '../../Utils/DateDropDown.dart';
import 'SkipPages/HowFeelingPage.dart';

class SingupForm extends StatefulWidget {
  const SingupForm({super.key});

  @override
  State<SingupForm> createState() => _SingupFormState();
}

class _SingupFormState extends State<SingupForm> {
  String? selectedOption;
  int? dobDay;
  int? dobMonth;
  int? dobYear;
  final signupFormKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isTablet = isTabletDevice(context); // Use the utility function

    return Scaffold(
        appBar: AppBar(

          backgroundColor: AppTheme.themePink,
          centerTitle: true,
          automaticallyImplyLeading: false,

          toolbarHeight: 14.h,
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
          title:
          CommonUI().myText(
              text: "Sign up",
              color: AppTheme.white,
              fontSize: 20.sp,
              fontfamily: "Nunito",
              fontWeight: FontWeight.w700),        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80.h,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.w, 0, 6.w, 0),
                  child: Form(
                    key: signupFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(3.h),
                        CommonUI().myText(
                            text: "Enter your basic details to register",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppTheme.themePink),
                        Gap(4.h),
                        CommonUI().myText(
                          text: "First Name",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: AppTheme.black,
                        ),
                        Gap(2.h),
                        CommonUI().formFields(
                          controller: firstNameController,
                          hintText: "Enter your firstname",
                          hintfontsize: 12.sp,
                          fontfamily: "Nunito",
                          fontsize: 13.sp,
                          enabled: true,
                          height: 10.h,
                          width: 90.w,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid firstname';
                            }
                            return null;
                          },
                        ),
                        Gap(4.h),
                        CommonUI().myText(
                          text: "Last Name",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: AppTheme.black,
                        ),
                        Gap(2.h),
                        CommonUI().formFields(
                          controller: lastNameController,
                          hintText: "Enter your lasttname",
                          hintfontsize: 12.sp,
                          fontfamily: "Nunito",
                          fontsize: 13.sp,
                          enabled: true,
                          height: 10.h,
                          width: 90.w,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid lastname';
                            }
                            return null;
                          },
                        ),
                        Gap(4.h),
                        CommonUI().myText(
                          text: "Date of Birth",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: AppTheme.black,
                        ),
                        Gap(2.h),
                        DateDropdownsRow(),
                        // Builder(builder: (context) {
                        //   return
                        //     DropdownDatePicker(
                        //     // inputDecoration: InputDecoration(
                        //     //   border: BorderSide.none
                        //     // ),
                        //     icon: Icon(
                        //       applyTextScaling: true,
                        //       textDirection: TextDirection.ltr,
                        //       Icons.arrow_drop_down_outlined,
                        //       color: AppTheme.themePink,
                        //       size: isTablet ? 17.sp :  30.sp,
                        //     ),
                        //     boxDecoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(6.0),
                        //         color: AppTheme.grey.withOpacity(0.1)),
                        //
                        //     isDropdownHideUnderline: true, // optional
                        //     isFormValidator: true, // optional
                        //     startYear: 1900, // optional
                        //     endYear: 2024, // optional
                        //     width: MediaQuery.of(context).size.width * 0.01,
                        //     // width: 2.w,
                        //     // optional
                        //     // width: 16, // optional
                        //     selectedDay: dobDay, // optional
                        //     selectedMonth: dobMonth, // optional
                        //     selectedYear: dobYear, // optional
                        //     onChangedDay: (value) {
                        //       dobDay = int.parse(value!);
                        //       print('onChangedDay: $value');
                        //     },
                        //     onChangedMonth: (value) {
                        //       dobMonth = int.parse(value!);
                        //       print('onChangedMonth: $value');
                        //     },
                        //     onChangedYear: (value) {
                        //       dobYear = int.parse(value!);
                        //       print('onChangedYear: $value');
                        //
                        //       // calculateAge(  DateTime(_selectedYear!, _selectedMonth!, _selectedDay!));
                        //     },
                        //
                        //     showDay: true,
                        //     monthFlex: 10, // optional
                        //     dayFlex: 8,
                        //     yearFlex:9, // optional
                        //     hintDay: 'Day', // optional
                        //     hintMonth: 'Month', // optional
                        //     hintYear: 'Year', // optional
                        //     hintTextStyle:
                        //         TextStyle(color: Colors.grey, fontSize: isTablet ?
                        //         8.sp : 10.sp ),
                        //     textStyle: TextStyle(
                        //       fontSize: 8.sp
                        //     ),// optional
                        //                               );
                        // }),
                        Gap(4.h),
                        CommonUI().myText(
                          text: "Country",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: AppTheme.black,
                        ),
                        Gap(2.h),
                        CommonUI().formFields(
                          controller: countryController,
                          hintText: "Enter your country",
                          hintfontsize: 12.sp,
                          fontfamily: "Nunito",
                          fontsize: 13.sp,
                          enabled: true,
                          height: 10.h,
                          width: 90.w,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid country';
                            }
                            return null;
                          },
                        ),
                        Gap(4.h),
                        CommonUI().myText(
                          text: "City",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: AppTheme.black,
                        ),
                        Gap(2.h),
                        CommonUI().formFields(
                          controller: cityController,
                          hintText: "Enter your city",
                          hintfontsize: 12.sp,
                          fontfamily: "Nunito",
                          fontsize: 13.sp,
                          enabled: true,
                          height: 10.h,
                          width: 90.w,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid city';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                var form = signupFormKey.currentState;
                if (form?.validate() ?? true) {
                  var data = SignupFormObject(
                      firstname: firstNameController.text.trim(),
                      lastname: lastNameController.text.trim(),
                      dobDay: dobDay.toString(),
                      dobMonth: dobMonth.toString(),
                      dobYear: dobYear.toString(),
                      country: countryController.text.trim(),
                      city: cityController.text);
                  print("data.toJson()");
                  print(data.toJson());
                  if(data != null){

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HowFeelingPage(firstname:firstNameController.text)));
                  }
                } else {
                  print("form not valid");

                }
              },
              child: CommonUI().buttonContainer(
                  height: 4.5.h,
                  width: 80.w,
                  color: AppTheme.themePink,
                  //     :
                  // AppTheme.formFieldGrey,
                  child: Center(
                    child: CommonUI().myText(
                        text: "Register",
                        color: AppTheme.white,
                        fontSize: 15.sp),
                  )),
            ),
          ],
        ));
  }
}
