import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../Utils/AllImports.dart';

class PatientDetailForm extends StatefulWidget {
  const PatientDetailForm({super.key});

  @override
  State<PatientDetailForm> createState() => _PatientDetailFormState();
}

class _PatientDetailFormState extends State<PatientDetailForm> {
  String? selectedOption;
  int? dobDay;
  int? dobMonth;
  int? dobYear;
  final signupFormKey = GlobalKey<FormState>();
  TextEditingController medicalHistoryController = TextEditingController();
  TextEditingController surgicalHistoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController moreDetailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController treatmentTypeController = TextEditingController();

  List<TreatmentListType> treatmentList = [
    TreatmentListType(id: '0', treatmentType: "Heart Surgery"),
    TreatmentListType(id: '1', treatmentType: "Brain Tumor Surgery"),
    TreatmentListType(id: '2', treatmentType: "Knee Replacement"),
    TreatmentListType(id: '3', treatmentType: "Appendix Surgery"),

  ];
  String? selectedTreatmentTypeID;
  String? _selectedTreatment;
  bool _selectedOption = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          backgroundColor: AppTheme.themePink,
          centerTitle: true,
          automaticallyImplyLeading: false,

          toolbarHeight: 12.h,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              //  Radius.circular(12.h)
              bottomRight: Radius.circular(12.h),
              bottomLeft: Radius.circular(12.h),
            ),
          ),
          title:
          CommonUI().myText(
              text: "Patient Details",
              color: AppTheme.white,
              fontSize: 20.sp,
              fontfamily: "Nunito",
              fontWeight: FontWeight.w700),       ),


      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: 100.h,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.w, 0, 6.w, 0),
                child: Form(
                  key: signupFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(2.h),
                      CommonUI().myText(
                          text: "Enter your basic details to register",
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppTheme.themePink),
                      Gap(2.h),
                      CommonUI().myText(
                        text: "Medical History",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: AppTheme.black,
                      ),
                      Gap(2.h),
                      CommonUI().textFormField(
                        controller: medicalHistoryController,
                        hintText: "Enter medical history",
                        hintfontsize: 12.sp,
                        fontfamily: "Nunito",
                        fontsize: 13.sp,
                        enabled: true,
                        show: false,
                        height: 5.h,
                        width: 90.w,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid medical history';
                          }
                          return null;
                        },
                      ),
                      Gap(2.h),
                      CommonUI().myText(
                        text: "Surgical History",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: AppTheme.black,
                      ),
                      Gap(2.h),
                      CommonUI().textFormField(
                        controller: surgicalHistoryController,
                        hintText: "Enter surgical history",
                        hintfontsize: 12.sp,
                        fontfamily: "Nunito",
                        fontsize: 13.sp,
                        enabled: true,
                        show: false,
                        height: 5.h,
                        width: 90.w,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid surgical history';
                          }
                          return null;
                        },
                      ),
                      Gap(3.h),
                      // Past Treatment History
                      CommonUI().myText(
                        text: "Past Treatment History",
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: AppTheme.textPink,
                      ),
                      Gap(2.h),
                      CommonUI().myText(text: "Types of Treatment"),
                      Gap(1.h),
                      Container(
                        height: 10.h,
                        width: 90.w,
                        // padding: EdgeInsets.all(5.0),
                        child: DropdownButtonFormField<String>(
                          icon: Icon(Icons.arrow_drop_down,
                              size: 30.sp,
                              color: AppTheme.themePink),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.formFieldGrey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide.none,
                            ),
                            // suffixIcon: Icon(Icons.arrow_drop_down,
                            //     size: 30.sp,
                            //     color: AppTheme.themePink),
                          ),
                          // hint: Text('Select Treatment'),
                          value: _selectedTreatment,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedTreatment = newValue;
                            });
                            print('Selected treatment id: ${newValue}');
                          },
                          items: treatmentList.map((TreatmentListType treatment) {
                            return DropdownMenuItem<String>(
                              value: treatment.id,
                              child: Text(treatment.treatmentType),
                            );
                          }).toList(),
                        ),
                      ),
                      // TypeAheadField(
                      //   textFieldConfiguration: TextFieldConfiguration(
                      //     controller: treatmentTypeController,
                      //     style: TextStyle(
                      //         color: AppTheme.blackColor,
                      //         fontSize: 12.sp,
                      //         fontWeight: FontWeight.w500,
                      //         fontFamily: 'Nunito'),
                      //     decoration: InputDecoration(
                      //       filled: true,
                      //       fillColor: Colors.grey[200],
                      //       contentPadding:
                      //       const EdgeInsets.symmetric(horizontal: 8, vertical: 7.0),
                      //       border: OutlineInputBorder(
                      //         borderSide: BorderSide.none,
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       helperStyle: const TextStyle(
                      //           color: AppTheme.primaryColor2, fontFamily: 'Nunito'),
                      //       suffixIcon:
                      //       Icon(Icons.arrow_drop_down,color: AppTheme.textPink, size:
                      //           30.sp,),
                      //       hintText: '',
                      //       focusedBorder: OutlineInputBorder(
                      //           borderSide: BorderSide.none,
                      //           borderRadius: BorderRadius.circular(10)),
                      //     ),
                      //
                      //   ),
                      //
                      //   suggestionsCallback: (pattern) async {
                      //     return await _statefetchSuggestions(pattern, context);
                      //   },
                      //
                      //
                      //   itemBuilder: (context, suggestion) {
                      //     return Container(
                      //         decoration:
                      //         BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                      //         child: ListTile(
                      //             title: Column(
                      //               children: [
                      //                 Row(
                      //                   children: [
                      //                     Padding(
                      //                       padding: EdgeInsets.fromLTRB(2.w, 0, 0, 0),
                      //                       child: Container(
                      //                         width: 70.w,
                      //                         child: CommonUI().myText(
                      //                             text: suggestion.treatmentType,
                      //                             maxLines: 2,
                      //                             color: AppTheme.blackColor,
                      //                             fontSize: 12.sp),
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 const Divider(
                      //                   endIndent: 0,
                      //                 )
                      //               ],
                      //             )));
                      //   },
                      //   suggestionsBoxDecoration: SuggestionsBoxDecoration(
                      //       borderRadius: BorderRadius.circular(10.0),
                      //       color: AppTheme.whiteColor,
                      //       elevation: 4.0),
                      //   onSuggestionSelected: (suggestion) {
                      //     _stateonItemSelected(suggestion, context);
                      //   },
                      //
                      //
                      // ),

                      Gap(2.h),
                      CommonUI().myText(
                        text: "Month / Year",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: AppTheme.black,
                      ),
                      Gap(2.h),
                      Builder(builder: (context) {
                        return DropdownDatePicker(
                          // inputDecoration: InputDecoration(
                          //   border: BorderSide.none
                          // ),
                          icon: Icon(
                            applyTextScaling: true,
                            textDirection: TextDirection.ltr,
                            Icons.arrow_drop_down_outlined,
                            color: AppTheme.themePink,
                            size: 30.sp,
                          ),
                          boxDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: AppTheme.formFieldGrey),

                          isDropdownHideUnderline: true, // optional
                          isFormValidator: true, // optional
                          startYear: 1900, // optional
                          endYear: 2024, // optional
                          width: 4.w, // optional
                          // width: 16, // optional
                          // selectedDay: dobDay, // optional
                          selectedMonth: dobMonth, // optional
                          selectedYear: dobYear, // optional
                          onChangedDay: (value) {
                            dobDay = int.parse(value!);
                            print('onChangedDay: $value');
                          },
                          onChangedMonth: (value) {
                            dobMonth = int.parse(value!);
                            print('onChangedMonth: $value');
                          },
                          onChangedYear: (value) {
                            dobYear = int.parse(value!);
                            print('onChangedYear: $value');

                            // calculateAge(  DateTime(_selectedYear!, _selectedMonth!, _selectedDay!));
                          },

                          showDay: false,
                          monthFlex: 5, // optional
                          // dayFlex: 0,
                          yearFlex: 5, // optional
                          // hintDay: 'Day', // optional
                          hintMonth: 'Month', // optional
                          hintYear: 'Year', // optional
                          hintTextStyle:
                          TextStyle(color: Colors.grey), // optional
                        );
                      }),
                      Gap(2.h),
                      CommonUI().myText(
                        text: "Success / Failure",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: AppTheme.black,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                                checkColor: AppTheme.white,
                                activeColor: AppTheme.themePink,
                                value: _selectedOption == true,
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      _selectedOption = true;
                                    } else {
                                      // _selectedOption = null;
                                    }
                                  });
                                },
                              ),
                              CommonUI().myText(text: "Success",
                                  fontfamily: "Nunito",
                                  fontSize: 13.sp,
                                  color: AppTheme.textPink),

                              SizedBox(width: 20),
                              // Add some spacing between the checkboxes
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                checkColor: AppTheme.white,
                                activeColor: AppTheme.themePink,
                                value: _selectedOption == false,
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      _selectedOption = false;
                                    } else {
                                      // _selectedOption = null;
                                    }
                                  });
                                },
                              ),
                              CommonUI().myText(text: "Failure",
                                  fontfamily: "Nunito",
                                  fontSize: 13.sp,
                                  color: AppTheme.textPink),
                            ],
                          ), // Add some spacing between the checkboxes

                        ],
                      ),

                      Gap(2.h),
                      CommonUI().myText(
                        text: "More Details",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: AppTheme.black,
                      ),
                      // Gap(2.h),
                      TextFormField(
                        controller: moreDetailController,
                        maxLines: 4,

                        decoration: InputDecoration(
                          // labelText: 'Enter your comment',
                          // hintText: 'Type your comment here...',

                          filled: true,
                          fillColor: AppTheme.formFieldGrey,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a comment';
                          }
                          return null;
                        },
                      ),
                      // CommonUI().textFormField(
                      //   maxLines: 5,
                      //   controller: countryController,
                      //   hintText: "Enter your country",
                      //   hintfontsize: 12.sp,
                      //   fontfamily: "Nunito",
                      //   fontsize: 13.sp,
                      //   enabled: true,
                      //   show: false,
                      //   height: 5.h,
                      //   width: 90.w,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter a valid country';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // Gap(1.h),


                    ],
                  ),
                ),
              ),
            )
          ],
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegistrationSuccess()));
              },
              child: Image.asset(AppConstants.circleArrowIcon, scale: 4.5,))
        ],
      ),
    );
  }
 }

