import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uds_employee/Bloc/SalaryBloc.dart';
import 'package:uds_employee/Repository/APIToken.dart';

import '../../../Allnavigations/AllBlocDirectory.dart';
import '../../../Allnavigations/AllimportedDirectory.dart';
import '../../../Utils/AppTheme.dart';
import '../SalaryScreen.dart';

class ResignForm extends StatefulWidget {
   ResignForm({super.key, this.id});
   String? id;


  @override
  State<ResignForm> createState() => _ResignFormState();
}

class _ResignFormState extends State<ResignForm> {
  TextEditingController _reasonController = TextEditingController();
  TextEditingController _noticePeriodController = TextEditingController();
  TextEditingController _controllerLastDay = TextEditingController();
  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;
  String? userID;
  String? lastDate;
  var resignFormKey = GlobalKey<FormState>();
  bool isNotice = false;
  GetResignObject? resignFormData; //AA
  bool isGet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserID();
    isGet =false;
  }

  getUserID() async {
    final prefs = await SharedPreferences.getInstance();

    userID = prefs.getString("id");
    print("$userID userId");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          SalaryBloc  bloc = SalaryBloc();
          print("widget.id===");
          print(widget.id);
         widget.id.toString() != "null" ?  bloc.add(GetResignFormEvent(context, widget.id!)) : bloc; //AA
          return bloc;
        },
        child: BlocListener<SalaryBloc, SalaryState>(
            listener: (context, state) {
              if(state is UpdateResignFormSuccessState){

                print("$state update");
                print(state.data);
                showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      title: CommonUI().myText(
                          text: 'UDS',
                          textAlign: TextAlign.center,
                          color: AppTheme.primaryColor2),
                      actionsAlignment: MainAxisAlignment.end,
                      content: CommonUI().myText(
                          text: 'Resign form details updated successfully!!',
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.center,
                          color: AppTheme.primaryColor2,
                          maxLines: 2),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: CommonUI().myText(
                            text: 'Ok',
                          ),
                        ),
                      ],
                    );
                  },
                );
              }

              if(state is GetResignFormSuccessState){
                print("$state getresignsss===");
                // print(state.data['data']);
                isGet = true;
              resignFormData =  GetResignObject.fromJson(state.data['data']);
              print(resignFormData!.purpose);
              print(resignFormData!.requestType);
              print(resignFormData!.reasonForDecline);
              print(resignFormData!.status);
              print(resignFormData!.empDate);
              print(resignFormData!.isEmployee);
              print(resignFormData!.isManager);
              // print(resignFormData!.);
              _reasonController.text = resignFormData!.purpose;
                _noticePeriodController.text = resignFormData!.empDate;
                setState(() {
                  _controllerLastDay.text = DateTime.now()
                      .add(Duration(days: int.parse(resignFormData!.empDate))).toString().split(" ")[0];
                });

                // resignFormData  //AA
              }
          if (state is CreateResignRequestSuccessState) {
            print("$state successs");
            showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: CommonUI().myText(
                      text: 'UDS',
                      textAlign: TextAlign.center,
                      color: AppTheme.primaryColor2),
                  actionsAlignment: MainAxisAlignment.end,
                  content: CommonUI().myText(
                      text: 'Resign requested successfully!!',
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.center,
                      color: AppTheme.primaryColor2,
                      maxLines: 2),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: CommonUI().myText(
                        text: 'Ok',
                      ),
                    ),
                  ],
                );
              },
            );
          }
        }, child:
                BlocBuilder<SalaryBloc, SalaryState>(builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppTheme.whiteColor,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Gap(2.w),
                  CommonUI().myText(
                    text: "Resign Form",
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
                child: Form(
                  key: resignFormKey,
                  child: Column(
                    children: [
                      Gap(2.h),
                      Align(
                          alignment: Alignment.topLeft,
                          child: CommonUI().myText(text: "Reason")),
                      Gap(1.5.h),
                      CommonUI.textAreaFormField(
                        maxLines: 5,
                        fillcolor: AppTheme.grey.withOpacity(0.1),
                        editingController: _reasonController,
                        hinttext: '',
                        enabled: true,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "Enter the valid reason";
                          }
                        },
                      ),
                      Gap(4.h),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              CommonUI().myText(text: "Notice Period  "),
                              CommonUI()
                                  .myText(text: "(in days)", fontSize: 10.sp),
                            ],
                          )),
                      Gap(1.5.h),
                      Row(
                        children: [
                          SizedBox(
                            width:  isNotice ? 60.w : 15.w,
                            child: CommonUI.formField(
                                editingController: _noticePeriodController,
                                keyboardType: TextInputType.number,
                                maxLength: 2,
                                hinttext: "",
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return null;
                                  } else {
                                    setState(() {
                                      isNotice = true;

                                    });
                                    return "Enter valid notice period";
                                  }
                                },
                                onChanged: (value) {
                                  lastDate = DateTime.now()
                                      .add(Duration(days: int.parse(value!)))
                                      .toString();
                                  print("$lastDate lastDate");
                                  _controllerLastDay.text =
                                      lastDate!.split(" ")[0];
                                }),
                          ),
                          Gap(4.w),
                          CommonUI().myText(text: "Days")
                        ],
                      ),
                      Gap(4.h),
                      Align(
                          alignment: Alignment.topLeft,
                          child: CommonUI().myText(text: "Last Working Date")),
                      Gap(1.5.h),
                      CommonUI.formField(
                          editingController: _controllerLastDay,
                          hinttext: "",
                          enabled: false),
                      // Builder(
                      //   builder: (context) {
                      //     return DropdownDatePicker(
                      //       // inputDecoration: InputDecoration(
                      //       //   border: BorderSide.none
                      //       // ),
                      //       boxDecoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(6.0),
                      //           color: AppTheme.grey.withOpacity(0.1)),
                      //
                      //       locale: "en",
                      //
                      //       isDropdownHideUnderline: true, // optional
                      //       isFormValidator: true, // optional
                      //       startYear: 1900, // optional
                      //       endYear: 2024, // optional
                      //       width: 16, // optional
                      //       selectedDay:  _selectedDay, // optional
                      //       selectedMonth: _selectedMonth, // optional
                      //       selectedYear: _selectedYear, // optional
                      //       onChangedDay: (value) {
                      //         _selectedDay = int.parse(value!);
                      //         print('onChangedDay: $value');
                      //       },
                      //       onChangedMonth: (value) {
                      //         _selectedMonth = int.parse(value!);
                      //         print('onChangedMonth: $value');
                      //       },
                      //       onChangedYear: (value) {
                      //         _selectedYear = int.parse(value!);
                      //         print('onChangedYear: $value');
                      //
                      //         // calculateAge(  DateTime(_selectedYear!, _selectedMonth!, _selectedDay!));
                      //       },
                      //       // boxDecoration: BoxDecoration(
                      //       //   borderRadius: BorderRadius.circular(6),
                      //       //   color: AppTheme.FieldGrey,
                      //       // ), // optional
                      //       showDay: true,
                      //       monthFlex: 4, // optional
                      //       dayFlex: 3,
                      //       yearFlex: 4, // optional
                      //       hintDay: 'Day', // optional
                      //       hintMonth: 'Month', // optional
                      //       hintYear: 'Year', // optional
                      //       hintTextStyle: TextStyle(color: Colors.grey), // optional
                      //     );
                      //   }
                      // ),
                      Gap(20.h),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonUI.buttonContainer(
                                height: 5.h,
                                width: 40.w,
                                onPressed: () {
                                  var form = resignFormKey.currentState;

                                  if (form?.validate() ?? true) {
                                    var data = CreateResignRequest(
                                        requestType: "request",
                                        empDate:
                                        _noticePeriodController.text.trim(),
                                        purpose: _reasonController.text.trim(),
                                        isEmployee: false,
                                        userId: userID!);
                                    var dataUpdate = CreateResignRequest(
                                        requestType: "request",
                                        empDate:
                                        _noticePeriodController.text.trim(),
                                        purpose: _reasonController.text.trim(),
                                        isEmployee: false,
                                        userId: userID!);

                               !isGet ?  BlocProvider.of<SalaryBloc>(context).add(
                                        CreateResignRequestEvent(context, data))
                               :
                               BlocProvider.of<SalaryBloc>(context).add(
                                   UpdateResignRequestEvent(context, data,widget.id!));


                                  }

                                },
                                file: Center(
                                    child:
                                  !isGet ?
                                  CommonUI().myText(
                                        text: "Submit",
                                        color: AppTheme.whiteColor)

                                  : CommonUI().myText(
                                        text: "Update",
                                        color: AppTheme.whiteColor)

                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        })));
  }
}
