import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Allnavigations/AllBlocDirectory.dart';
import '../../../Allnavigations/AllimportedDirectory.dart';
import '../../../Bloc/SalaryBloc.dart';
import '../../../Utils/AppTheme.dart';

class NoDueForm extends StatefulWidget {
   NoDueForm({super.key, this.noDueId, this.userID});
  String? noDueId;
  String? userID;

  @override
  State<NoDueForm> createState() => _NoDueFormState();
}

class _NoDueFormState extends State<NoDueForm> {
  TextEditingController _empNameController = TextEditingController();
  TextEditingController _empCodeController = TextEditingController();
  TextEditingController _empDesignationController = TextEditingController();
  TextEditingController _empLocationController = TextEditingController();
  TextEditingController _empDepartmentController = TextEditingController();
  TextEditingController _empDateJoiningController = TextEditingController();
  TextEditingController _empOfficialMailIdController = TextEditingController();
  TextEditingController _empDateRelievingController = TextEditingController();
  TextEditingController _empPersonalContactController = TextEditingController();
  TextEditingController _empPersonalEmailController = TextEditingController();
  SingleValueDropDownController _knowledgeController =
      SingleValueDropDownController();
  SingleValueDropDownController _backupController =
      SingleValueDropDownController();
  SingleValueDropDownController _otherHandOverController = SingleValueDropDownController();
  // TextEditingController _ClearanceController = TextEditingController();
  SingleValueDropDownController _ClearanceController = SingleValueDropDownController();
  SingleValueDropDownController _salaryAdvanceController = SingleValueDropDownController();
  SingleValueDropDownController _otherAdvanceController = SingleValueDropDownController();
  SingleValueDropDownController _pettyCashController = SingleValueDropDownController();
  SingleValueDropDownController _settleExpensesController = SingleValueDropDownController();
  SingleValueDropDownController _itDocController = SingleValueDropDownController();
  SingleValueDropDownController _happyAccountController = SingleValueDropDownController();
  SingleValueDropDownController _laptopController = SingleValueDropDownController();
  SingleValueDropDownController _cardAccessoriesController = SingleValueDropDownController();
  SingleValueDropDownController _sapLoginController = SingleValueDropDownController();
  SingleValueDropDownController _emailIdController = SingleValueDropDownController();
  SingleValueDropDownController _loginIdController = SingleValueDropDownController();
  SingleValueDropDownController _idAccessCardController = SingleValueDropDownController();
  SingleValueDropDownController _drawKeyController = SingleValueDropDownController();
  SingleValueDropDownController _businessCardController = SingleValueDropDownController();
  SingleValueDropDownController _headsetController = SingleValueDropDownController();
  SingleValueDropDownController _simController = SingleValueDropDownController();
  SingleValueDropDownController _stationaryItemsController = SingleValueDropDownController();
  SingleValueDropDownController _chargerCableController = SingleValueDropDownController();
  SingleValueDropDownController _medicalClaimController = SingleValueDropDownController();
  SingleValueDropDownController _exitInterviewController = SingleValueDropDownController();
  SingleValueDropDownController _resignMailController = SingleValueDropDownController();
  SingleValueDropDownController _noticePeriodController = SingleValueDropDownController();
  SingleValueDropDownController _relevantController = SingleValueDropDownController();
  SingleValueDropDownController _companyPropertyController = SingleValueDropDownController();


  String? selectedOption;
  int? _selectedJoiningDay;
  int? _selectedJoiningMonth;
  int? _selectedJoiningYear;

  int? _selectedRelievingDay;
  int? _selectedRelievingMonth;
  int? _selectedRelievingYear;


  String? kt;
  String? backUp;
  String? clearance;
  String? salaryAdvance;
  String? otherAdvance;
  String? pettyCash;
  String? settleExpenses;
  String? itDoc;
  String? happyAccount;
  String? laptop;
  String? cardAccessories;
  String? sapLogin;
  String? emailId;
  String? loginId;
  String? idAccessCard;
  String? drawKey;
  String? businessCard;
  String? headset;
  String? sim;
  String? stationaryItems;
  String? chargerCable;
  String? medicalClaim;
  String? exitInterview;
  String? resignMail;
  String? noticePeriod;
  String? relevant;
  String? companyProperty;
  String? otherHandover;
  final _noDueFormKey = GlobalKey<FormState>();
  GetNoDueObject? getNoDueData;
  bool isGetNoDue =false;
  FetchEmployeeDataObject? employeeDetails;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUserID();
    print("widget.userID==");
    print(widget.userID);
    // _ClearanceController =SingleValueDropDownController(data: const DropDownValueModel(name: "yess", value: "yess"));
  }

  // getUserID() async{
  //   final prefs=await SharedPreferences.getInstance();
  //
  //   userID = prefs.getString("id")!;
  //   print("$userID userId");
  // }

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
          create: (context) {
            SalaryBloc bloc = SalaryBloc();
            bloc.add(FetchEmployeeDataEvent(context, widget.userID));

            widget.noDueId.toString() != "null" ?  bloc.add(GetNoDueFormEvent(context, widget.noDueId!)) : bloc;
            return bloc;
          },
          child: BlocListener<SalaryBloc, SalaryState>(
              listener: (context, state) {
                if(state is FetchEmployeeDataSuccessState){
                  print("1233");
                  print("$state fetch");
                  print(state.data['data']);
                  employeeDetails = FetchEmployeeDataObject.fromJson(state.data['data']);
                  print(employeeDetails!.emailId);
                  print(employeeDetails!.designation);
                  print(employeeDetails!.department);
                  print(employeeDetails!.userUid);
                  print(employeeDetails!.firstName);
                  setState(() {
                    print("employeeDetails!.permanentAddress");
                    print(employeeDetails!.permanentAddress);
                    print("int.parse(employeeDetails!.joiningDate.toString().split("")[0])" );
                    print(int.parse(employeeDetails!.joiningDate.toString().split("-")[0]) );

                    _empPersonalEmailController.text = employeeDetails!.emailId;
                    _empPersonalContactController.text = employeeDetails!.phoneNumber;
                    // _empPersonalContactController.text = employeeDetails!.phoneNumber;
                    _empNameController.text = employeeDetails!.firstName;
                    _empCodeController.text = employeeDetails!.userUid != null ? employeeDetails!.userUid : "-";
                    _empDepartmentController.text = employeeDetails!.department;
                    _empDesignationController.text = employeeDetails!.designation;
                    _empLocationController.text = employeeDetails!.permanentAddress.isNotEmpty ? employeeDetails!.permanentAddress : employeeDetails!.presentAddress;

                    _selectedJoiningYear = employeeDetails!.joiningDate.isNotEmpty? int.parse(employeeDetails!.joiningDate.toString().split("-")[0]) : DateTime.now().year;
                    _selectedJoiningMonth = employeeDetails!.joiningDate.isNotEmpty? int.parse(employeeDetails!.joiningDate.toString().split("-")[1]) : DateTime.now().month;
                    _selectedJoiningDay =employeeDetails!.joiningDate.isNotEmpty? int.parse(employeeDetails!.joiningDate.toString().split("-")[2]): DateTime.now().day;


                  });

                }
                if(state is GetNoDueFormSuccessState){
                  print("$state GetNoDuesss======");
                  print(state.data);

                  isGetNoDue = true;
                  getNoDueData = GetNoDueObject.fromJson(state.data);

                  setState(() {


                    print("getNoDueData!.kt!");
                    print(getNoDueData!.kt!);
                    print("getNoDueData!.dateOfRelieving");
                    print(getNoDueData!.dateOfRelieving);



                    // _empLocationController.text = getNoDueData!.location;
                    _empOfficialMailIdController.text = getNoDueData!.officialEmail.isNotEmpty ? getNoDueData!.officialEmail : " ";
                    // c.text = getNoDueData!.officialEmail;
                    _selectedRelievingYear = getNoDueData!.dateOfRelieving.isNotEmpty? int.parse(getNoDueData!.dateOfRelieving.toString().split("-")[2]) : DateTime.now().year;
                    _selectedRelievingMonth = getNoDueData!.dateOfRelieving.isNotEmpty? int.parse(getNoDueData!.dateOfRelieving.toString().split("-")[1]) : DateTime.now().month;
                    _selectedRelievingDay =getNoDueData!.dateOfRelieving.isNotEmpty? int.parse(getNoDueData!.dateOfRelieving.toString().split("-")[0]): DateTime.now().day;
                    _knowledgeController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.kt.toString() =="null" ? "Nil" : getNoDueData!.kt, value:  getNoDueData!.kt.toString() =="null" ? "Nil" : getNoDueData!.kt ));
                    _backupController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.backUp.toString() =="null" ? "Nil" : getNoDueData!.backUp, value:  getNoDueData!.kt.toString() =="null" ? "Nil" : getNoDueData!.backUp ));
                    _ClearanceController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.clearance.toString() =="null" ? "Nil" : getNoDueData!.clearance, value:  getNoDueData!.clearance.toString() =="null" ? "Nil" : getNoDueData!.clearance ));
                    _salaryAdvanceController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.salaryAdvance.toString() =="null" ? "Nil" : getNoDueData!.salaryAdvance, value:  getNoDueData!.salaryAdvance.toString() =="null" ? "Nil" : getNoDueData!.salaryAdvance ));
                    _otherAdvanceController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.otherAdvance.toString() =="null" ? "Nil" : getNoDueData!.otherAdvance, value:  getNoDueData!.otherAdvance.toString() =="null" ? "Nil" : getNoDueData!.otherAdvance ));
                    _pettyCashController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.pettyCash.toString() =="null" ? "Nil" : getNoDueData!.pettyCash, value:  getNoDueData!.pettyCash.toString() =="null" ? "Nil" : getNoDueData!.pettyCash ));
                    _settleExpensesController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.settleExpenses.toString() =="null" ? "Nil" : getNoDueData!.settleExpenses, value:  getNoDueData!.settleExpenses.toString() =="null" ? "Nil" : getNoDueData!.settleExpenses ));
                    _itDocController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.itDoc.toString() =="null" ? "Nil" : getNoDueData!.itDoc, value:  getNoDueData!.itDoc.toString() =="null" ? "Nil" : getNoDueData!.itDoc ));
                    _happyAccountController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.happyAccount.toString() =="null" ? "Nil" : getNoDueData!.happyAccount, value:  getNoDueData!.happyAccount.toString() =="null" ? "Nil" : getNoDueData!.happyAccount ));
                    _laptopController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.laptop.toString() =="null" ? "Nil" : getNoDueData!.laptop, value:  getNoDueData!.laptop.toString() =="null" ? "Nil" : getNoDueData!.laptop ));
                    _cardAccessoriesController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.cardAccessories.toString() =="null" ? "Nil" : getNoDueData!.cardAccessories, value:  getNoDueData!.cardAccessories.toString() =="null" ? "Nil" : getNoDueData!.cardAccessories ));
                    _sapLoginController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.sapLogin.toString() =="null" ? "Nil" : getNoDueData!.sapLogin, value:  getNoDueData!.sapLogin.toString() =="null" ? "Nil" : getNoDueData!.sapLogin ));
                    _emailIdController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.emailId.toString() =="null" ? "Nil" : getNoDueData!.emailId, value:  getNoDueData!.emailId.toString() =="null" ? "Nil" : getNoDueData!.emailId ));
                    _loginIdController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.loginId.toString() =="null" ? "Nil" : getNoDueData!.loginId, value:  getNoDueData!.loginId.toString() =="null" ? "Nil" : getNoDueData!.loginId ));
                    _idAccessCardController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.idAccessCard.toString() =="null" ? "Nil" : getNoDueData!.idAccessCard, value:  getNoDueData!.idAccessCard.toString() =="null" ? "Nil" : getNoDueData!.idAccessCard ));
                    _drawKeyController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.drawKey.toString() =="null" ? "Nil" : getNoDueData!.drawKey, value:  getNoDueData!.drawKey.toString() =="null" ? "Nil" : getNoDueData!.drawKey ));
                    _businessCardController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.businessCard.toString() =="null" ? "Nil" : getNoDueData!.businessCard, value:  getNoDueData!.businessCard.toString() =="null" ? "Nil" : getNoDueData!.businessCard ));
                    _headsetController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.headset.toString() =="null" ? "Nil" : getNoDueData!.headset, value:  getNoDueData!.headset.toString() =="null" ? "Nil" : getNoDueData!.headset ));
                    _simController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.sim.toString() =="null" ? "Nil" : getNoDueData!.sim, value:  getNoDueData!.sim.toString() =="null" ? "Nil" : getNoDueData!.sim ));
                    _stationaryItemsController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.stationaryItems.toString() =="null" ? "Nil" : getNoDueData!.stationaryItems, value:  getNoDueData!.stationaryItems.toString() =="null" ? "Nil" : getNoDueData!.stationaryItems ));
                    _chargerCableController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.chargerCable.toString() =="null" ? "Nil" : getNoDueData!.chargerCable, value:  getNoDueData!.chargerCable.toString() =="null" ? "Nil" : getNoDueData!.chargerCable ));
                    _medicalClaimController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.medicalClaim.toString() =="null" ? "Nil" : getNoDueData!.medicalClaim, value:  getNoDueData!.medicalClaim.toString() =="null" ? "Nil" : getNoDueData!.medicalClaim ));
                    _exitInterviewController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.exitInterview.toString() =="null" ? "Nil" : getNoDueData!.exitInterview, value:  getNoDueData!.exitInterview.toString() =="null" ? "Nil" : getNoDueData!.exitInterview ));
                   _resignMailController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.resignMail.toString() =="null" ? "Nil" : getNoDueData!.resignMail, value:  getNoDueData!.resignMail.toString() =="null" ? "Nil" : getNoDueData!.resignMail ));
                    _noticePeriodController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.noticePeriod.toString() =="null" ? "Nil" : getNoDueData!.noticePeriod, value:  getNoDueData!.noticePeriod.toString() =="null" ? "Nil" : getNoDueData!.noticePeriod ));
                    _relevantController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.relevant.toString() =="null" ? "Nil" : getNoDueData!.relevant, value:  getNoDueData!.relevant.toString() =="null" ? "Nil" : getNoDueData!.relevant ));
                    _companyPropertyController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.companyProperty.toString() =="null" ? "Nil" : getNoDueData!.companyProperty, value:  getNoDueData!.companyProperty.toString() =="null" ? "Nil" : getNoDueData!.companyProperty ));
                    _otherHandOverController =SingleValueDropDownController(data:  DropDownValueModel(name: getNoDueData!.otherHandover.toString() =="null" ? "Nil" : getNoDueData!.otherHandover, value:  getNoDueData!.otherHandover.toString() =="null" ? "Nil" : getNoDueData!.otherHandover ));


                  });
                  //location: _empLocationController.text.trim(),
                  //                                 dateOfRelieving: DateTime(_selectedRelievingYear!,_selectedRelievingMonth!,_selectedRelievingDay!).toString().split(" ")[0],
                  //                                 officialEmail: _empOfficialMailIdController.text.trim(),
                  //                                 kt: kt.toString(),
                  //                                 backUp:  backUp.toString(),
                  //                                 clearance: clearance.toString(),
                  //                                 salaryAdvance: salaryAdvance.toString(),
                  //                                 otherAdvance: otherAdvance.toString(),
                  //                                 pettyCash: pettyCash.toString(),
                  //                                 settleExpenses: settleExpenses.toString(),
                  //                                 itDoc: itDoc.toString(),
                  //                                 happyAccount: happyAccount.toString(),
                  //                                 laptop: laptop.toString(),
                  //                                 cardAccessories : cardAccessories.toString(),
                  //                                 sapLogin : sapLogin.toString(),
                  //                                 emailId : emailId.toString(),
                  //                                 loginId : loginId.toString(),
                  //                                 idAccessCard : idAccessCard.toString(),
                  //                                 drawKey : drawKey.toString(),
                  //                                 businessCard : businessCard.toString(),
                  //                                 headset : headset.toString(),
                  //                                 sim : sim.toString(),
                  //                                 stationaryItems : stationaryItems.toString(),
                  //                                 chargerCable : chargerCable.toString(),
                  //                                 medicalClaim : medicalClaim.toString(),
                  //                                 exitInterview : exitInterview.toString(),
                  //                                 resignMail : resignMail.toString(),
                  //                                 noticePeriod: noticePeriod.toString(),
                  //                                 relevant: relevant.toString(),
                  //                                 companyProperty : companyProperty.toString(),
                  //                                 otherHandover : otherHandover.toString(),
                  //                                 userId : userID!
                  //
                  //
                  //

                }
                if(state is UpdateNoDueRequestSuccessState){
                  print("$state update");
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
                            text: 'Form updated successfully!!',
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
                if(state is CreateNoDueRequestSuccessState){
                  print("$state success state");
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
                            text: 'Form submitted successfully!!',
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
                if(state is CreateNoDueRequestErrorState){
                  print("${state.error} error");
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
                      text: "NoDue Form",
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
                  child: Form(
                    key: _noDueFormKey,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(text: "Name of Employee "),
                              ],
                            )),
                        Gap(1.h),
                        CommonUI.formField(
                            editingController: _empNameController, hinttext: ""),
                        Gap(3.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(text: "Employee Code"),
                              ],
                            )),
                        Gap(1.h),
                        CommonUI.formField(
                            editingController: _empCodeController, hinttext: ""),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(text: "Designation"),
                              ],
                            )),
                        Gap(1.h),
                        CommonUI.formField(
                            editingController: _empDesignationController, hinttext: ""),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(text: "Location"),
                              ],
                            )),
                        Gap(1.h),
                        CommonUI.formField(
                            editingController: _empLocationController, hinttext: ""),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(text: "Department"),
                              ],
                            )),
                        Gap(1.h),
                        CommonUI.formField(
                            editingController: _empDepartmentController, hinttext: ""),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(text: "Date of Join"),
                              ],
                            )),
                        Gap(1.h),
                        // CommonUI.formField(
                        //     editingController: _empDateJoiningController, hinttext: ""),
                     state is FetchEmployeeDataSuccessState ||  state is GetNoDueFormSuccessState?
                        Builder(
                            builder: (context) {
                              return DropdownDatePicker(
                                // inputDecoration: InputDecoration(
                                //   border: BorderSide.none
                                // ),
                                boxDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: AppTheme.grey.withOpacity(0.1)),

                                locale: "en",

                                isDropdownHideUnderline: true, // optional
                                isFormValidator: true, // optional
                                startYear: 1900, // optional
                                endYear: 2024, // optional
                                width: 16, // optional
                                selectedDay:  _selectedJoiningDay, // optional
                                selectedMonth: _selectedJoiningMonth, // optional
                                selectedYear: _selectedJoiningYear, // optional
                                onChangedDay: (value) {
                                  _selectedJoiningDay = int.parse(value!);
                                  print('onChangedDay: $value');
                                },
                                onChangedMonth: (value) {
                                  _selectedJoiningMonth = int.parse(value!);
                                  print('onChangedMonth: $value');
                                },
                                onChangedYear: (value) {
                                  _selectedJoiningYear = int.parse(value!);
                                  print('onChangedYear: $value');

                                  // calculateAge(  DateTime(_selectedYear!, _selectedMonth!, _selectedDay!));
                                },

                                showDay: true,
                                monthFlex: 4, // optional
                                dayFlex: 3,
                                yearFlex: 4, // optional
                                hintDay: 'Day', // optional
                                hintMonth: 'Month', // optional
                                hintYear: 'Year', // optional
                                hintTextStyle: TextStyle(color: Colors.grey), // optional
                              );
                            }
                        ):
                       DropdownDatePicker(
                  // inputDecoration: InputDecoration(
                  //   border: BorderSide.none
                  // ),
                  boxDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                    color: AppTheme.grey.withOpacity(0.1)),

                locale: "en",

                isDropdownHideUnderline: true, // optional
                isFormValidator: true, // optional
                startYear: 1900, // optional
                endYear: 2024, // optional
                width: 16, // optional
                selectedDay:  _selectedJoiningDay, // optional
                selectedMonth: _selectedJoiningMonth, // optional
                selectedYear: _selectedJoiningYear, // optional
                onChangedDay: (value) {
                  _selectedJoiningDay = int.parse(value!);
                  print('onChangedDay: $value');
                },
                onChangedMonth: (value) {
                  _selectedJoiningMonth = int.parse(value!);
                  print('onChangedMonth: $value');
                },
                onChangedYear: (value) {
                  _selectedJoiningYear = int.parse(value!);
                  print('onChangedYear: $value');

                  // calculateAge(  DateTime(_selectedYear!, _selectedMonth!, _selectedDay!));
                },

                showDay: true,
                monthFlex: 4, // optional
                dayFlex: 3,
                yearFlex: 4, // optional
                hintDay: 'Day', // optional
                hintMonth: 'Month', // optional
                hintYear: 'Year', // optional
                hintTextStyle: TextStyle(color: Colors.grey), // optional
              ),

                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(text: "Date of Relieving"),
                              ],
                            )),
                        Gap(1.h),
                    state is FetchEmployeeDataSuccessState || state is GetNoDueFormSuccessState ?
                    Builder(
                            builder: (context) {
                              return DropdownDatePicker(
                                // inputDecoration: InputDecoration(
                                //   border: BorderSide.none
                                // ),
                                boxDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: AppTheme.grey.withOpacity(0.1)),

                                locale: "en",

                                isDropdownHideUnderline: true, // optional
                                isFormValidator: true, // optional
                                startYear: 1900, // optional
                                endYear: 2024, // optional
                                width: 16, // optional
                                selectedDay:  _selectedRelievingDay, // optional
                                selectedMonth: _selectedRelievingMonth, // optional
                                selectedYear: _selectedRelievingYear, // optional
                                onChangedDay: (value) {
                                  _selectedRelievingDay = int.parse(value!);
                                  print('onChangedDay: $value');
                                },
                                onChangedMonth: (value) {
                                  _selectedRelievingMonth = int.parse(value!);
                                  print('onChangedMonth: $value');
                                },
                                onChangedYear: (value) {
                                  _selectedRelievingYear = int.parse(value!);
                                  print('onChangedYear: $value');

                                  // calculateAge(  DateTime(_selectedYear!, _selectedMonth!, _selectedDay!));
                                },

                                showDay: true,
                                monthFlex: 4, // optional
                                dayFlex: 3,
                                yearFlex: 4, // optional
                                hintDay: 'Day', // optional
                                hintMonth: 'Month', // optional
                                hintYear: 'Year', // optional
                                hintTextStyle: TextStyle(color: Colors.grey), // optional
                              );
                            }
                        )
              :
                DropdownDatePicker(
                // inputDecoration: InputDecoration(
                //   border: BorderSide.none
                // ),
                boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
            color: AppTheme.grey.withOpacity(0.1)),

            locale: "en",

            isDropdownHideUnderline: true, // optional
            isFormValidator: true, // optional
            startYear: 1900, // optional
            endYear: 2024, // optional
            width: 16, // optional
            selectedDay:  _selectedRelievingDay, // optional
            selectedMonth: _selectedRelievingMonth, // optional
            selectedYear: _selectedRelievingYear, // optional
            onChangedDay: (value) {
            _selectedRelievingDay = int.parse(value!);
            print('onChangedDay: $value');
            },
            onChangedMonth: (value) {
            _selectedRelievingMonth = int.parse(value!);
            print('onChangedMonth: $value');
            },
            onChangedYear: (value) {
            _selectedRelievingYear = int.parse(value!);
            print('onChangedYear: $value');

            // calculateAge(  DateTime(_selectedYear!, _selectedMonth!, _selectedDay!));
            },

            showDay: true,
            monthFlex: 4, // optional
            dayFlex: 3,
            yearFlex: 4, // optional
            hintDay: 'Day', // optional
            hintMonth: 'Month', // optional
            hintYear: 'Year', // optional
            hintTextStyle: TextStyle(color: Colors.grey), // optional
            )
              ,
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(text: "Official Email"),
                              ],
                            )),
                        Gap(1.h),
                        CommonUI.formField(
                            editingController: _empOfficialMailIdController,

                            hinttext: "",
                            validator:
                                (value) {
                              if (value!.isNotEmpty && isValidEmailAddress(value)) {
                                return null;
                              }


                              return "Please Enter valid Email";
                            }),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(text: "Personal Contact"),
                              ],
                            )),
                        Gap(1.h),
                        CommonUI.formField(
                            editingController: _empPersonalContactController,
                            keyboardType: TextInputType.number,
                            validator:
                            (value) {
                if (value!.isNotEmpty) {
                return null;
                }


                return "Please Enter valid PhoneNumber";
                },
                            maxLength: 10,
                            hinttext: ""),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(text: "Personal Email"),
                              ],
                            )),
                        Gap(1.h),
                        CommonUI.formField(
                            validator:
                                (value) {
                              if (value!.isNotEmpty && isValidEmailAddress(value)) {
                                return null;
                              }


                              return "Please Enter valid Email or PhoneNumber";
                            },
                            editingController: _empPersonalEmailController, hinttext: ""),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(
                                    text: "Dept Head/ Reporting Manager",
                                    fontWeight: FontWeight.w600),
                              ],
                            )),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI()
                                    .myText(text: "Knowledge Transfer", fontSize: 11.sp),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          textFieldDecoration: InputDecoration(
                            hintText: "select one",
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // initialValue: "name4",
                          controller: _knowledgeController,
                          clearOption: true,
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                                name: 'No',
                                value: "no",
                                toolTipMsg:
                                "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                            DropDownValueModel(name: 'Nil', value: "null"),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            setState(() {
                              kt = val.value;
                            });

                          },
                        ),
                        Gap(3.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(text: "Back up", fontSize: 11.sp),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _backupController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            setState(() {
                              backUp = val.value;
                            });
                          },
                        ),
                        Gap(3.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text:
                                      "Clearance for short payments/deductions/outstanding if any",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: clearance,
                          controller: _ClearanceController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            setState(() {
                              clearance = val.value;
                            });
                          },
                        ),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI()
                                    .myText(text: "Payroll", fontWeight: FontWeight.w600),
                              ],
                            )),
                        Gap(3.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Salary Advance",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _salaryAdvanceController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            setState(() {
                              salaryAdvance = val.value;
                            });
                          },
                        ),
                        Gap(3.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Any other advance",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _otherAdvanceController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            otherAdvance = val.value;
                          },
                        ),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI()
                                    .myText(text: "Finance", fontWeight: FontWeight.w600),
                              ],
                            )),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Petty cash advances",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _pettyCashController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            pettyCash = val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Settlement of expenses",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _settleExpensesController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            settleExpenses = val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Submission of IT Documents",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _itDocController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            itDoc = val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Happy Account Closure",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _happyAccountController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            happyAccount = val.value;
                          },
                        ),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI()
                                    .myText(text: "IT", fontWeight: FontWeight.w600),
                              ],
                            )),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Laptop",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _laptopController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            laptop = val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Data card & Accessories",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _cardAccessoriesController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            cardAccessories = val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "SAP Login Id's",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _sapLoginController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            sapLogin = val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Email Id",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _emailIdController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            emailId = val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Login Id's",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _loginIdController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            loginId = val.value;
                          },

                        ),

                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI()
                                    .myText(text: "Admin", fontWeight: FontWeight.w600),
                              ],
                            )),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "ID Card & Access Card",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _idAccessCardController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            idAccessCard = val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Draw Keys",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _drawKeyController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            drawKey = val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Business Card",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _businessCardController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            businessCard = val.value;
                          },
                        ),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(
                                    text: "Purchase", fontWeight: FontWeight.w600),
                              ],
                            )),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Blackberry / Phone handset",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _headsetController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            headset =val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Sim Card",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _simController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            sim =val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Stationary Items",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _stationaryItemsController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            stationaryItems =val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Charger & Datacable",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _chargerCableController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            chargerCable = val.value;
                          },
                        ),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI().myText(
                                    text: "Mediclaim", fontWeight: FontWeight.w600),
                              ],
                            )),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Mediclaim",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _medicalClaimController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            medicalClaim = val.value;
                          },
                        ),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI()
                                    .myText(text: "HR", fontWeight: FontWeight.w600),
                              ],
                            )),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Exit Interview",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _exitInterviewController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            exitInterview =val.value;
                          },
                        ),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Resignation Mail / Copy",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _resignMailController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            resignMail = val.value;
                          },
                        ),

                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Notice Period served",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _noticePeriodController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            noticePeriod = val.value;
                          },
                        ),
                        Gap(4.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CommonUI()
                                    .myText(text: "Operations", fontWeight: FontWeight.w600),
                              ],
                            )),
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Relevant Correspondence",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        Gap(2.h),

                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _relevantController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: 'no',
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            relevant =val.value;
                          },
                        ),

                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Uniform / shoes or any other company property",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _companyPropertyController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: "no",
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            companyProperty = val.value;
                          },
                        ),

                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: CommonUI().myText(
                                      overflow: TextOverflow.visible,
                                      lineHeight: 0.2.h,
                                      text: "Any other handover",
                                      fontSize: 11.sp),
                                ),
                              ],
                            )),
                        Gap(1.h),
                        DropDownTextField(
                          textStyle: TextStyle(fontSize: 10.sp),
                          // initialValue: "name4",
                          controller: _otherHandOverController,
                          clearOption: true,
                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: AppTheme.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(10.0), // Adjust the border radius
                            ),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          searchDecoration: const InputDecoration(hintText: "select one"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,

                          dropDownList: const [
                            DropDownValueModel(name: 'Yes', value: 'yes'),
                            DropDownValueModel(
                              name: 'No',
                              value: "no",
                            ),
                            DropDownValueModel(name: 'Nil', value: null),
                          ],
                          onChanged: (val) {
                            print(val.value);
                            print(val.name);
                            print("selected value is $val");
                            otherHandover =val.value;
                          },
                        ),
                        Gap(4.h),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding:  EdgeInsets.fromLTRB(5.w,2.h,5.w,2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonUI.buttonContainer(
                        width: 60.w,
                        height: 4.h,
                        onPressed: (){
                          var form = _noDueFormKey.currentState;
                          if (form?.validate() ?? true) {

                            var data = CreateNoDueRequestObject(
                                location: _empLocationController.text.trim(),
                                dateOfRelieving: DateTime(_selectedRelievingYear!,_selectedRelievingMonth!,_selectedRelievingDay!).toString().split(" ")[0],
                                officialEmail: _empOfficialMailIdController.text.trim(),
                                kt: kt.toString(),
                                backUp:  backUp.toString(),
                                clearance: clearance.toString(),
                                salaryAdvance: salaryAdvance.toString(),
                                otherAdvance: otherAdvance.toString(),
                                pettyCash: pettyCash.toString(),
                                settleExpenses: settleExpenses.toString(),
                                itDoc: itDoc.toString(),
                                happyAccount: happyAccount.toString(),
                                laptop: laptop.toString(),
                                cardAccessories : cardAccessories.toString(),
                                sapLogin : sapLogin.toString(),
                                emailId : emailId.toString(),
                                loginId : loginId.toString(),
                                idAccessCard : idAccessCard.toString(),
                                drawKey : drawKey.toString(),
                                businessCard : businessCard.toString(),
                                headset : headset.toString(),
                                sim : sim.toString(),
                                stationaryItems : stationaryItems.toString(),
                                chargerCable : chargerCable.toString(),
                                medicalClaim : medicalClaim.toString(),
                                exitInterview : exitInterview.toString(),
                                resignMail : resignMail.toString(),
                                noticePeriod: noticePeriod.toString(),
                                relevant: relevant.toString(),
                                companyProperty : companyProperty.toString(),
                                otherHandover : otherHandover.toString(),
                                userId : widget.userID!


                            );

                         !isGetNoDue?
                         BlocProvider.of<SalaryBloc>(context).add(CreateNoDueRequestEvent(context, data))
                         :
                         BlocProvider.of<SalaryBloc>(context).add(UpdateNoDueRequestEvent(context, data, widget.noDueId!));

                          }
                          else{

                            print("formstate error");
                          }



                                  },
                        file:
                        Center(child:
                      !isGetNoDue ?  CommonUI().myText(text: "Submit",
                            color: AppTheme.whiteColor)
                            :
                            CommonUI().myText(text: "Update",
                            color: AppTheme.whiteColor)

                        ))
                  ],
                ),
              ),
            );
  })));


  }

  bool isValidPhoneNumber(String value) {
    // Phone number pattern: +1234567890, 1234567890, +12 345-678 90, etc.
    final RegExp phoneRegex =
    RegExp(r'^(\+\d{1,2})?[\s.-]?\(?\d{1,4}\)?[\s.-]?\d{1,10}$');
    bool isLengthValid = value.replaceAll(RegExp(r'[^\d]'), '').length <= 10;

    return phoneRegex.hasMatch(value) && isLengthValid;
    // return phoneRegex.hasMatch(value);
  }

  bool isValidEmailAddress(String value) {
    // Email address pattern
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(value);
  }
}
