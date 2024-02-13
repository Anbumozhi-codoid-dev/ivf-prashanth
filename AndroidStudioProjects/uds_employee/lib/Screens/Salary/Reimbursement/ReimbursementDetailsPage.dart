import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../Allnavigations/AllBlocDirectory.dart';
import '../../../Allnavigations/AllimportedDirectory.dart';
import '../../../Bloc/SalaryBloc.dart';
import '../../../Utils/AppTheme.dart';

class ReimbursementDetails extends StatefulWidget {

   ReimbursementDetails({super.key, this.reimbursementID});
   String? reimbursementID;

  @override
  State<ReimbursementDetails> createState() => _ReimbursementDetailsState();
}

class _ReimbursementDetailsState extends State<ReimbursementDetails> {

  TextEditingController _ReasonTypeController = TextEditingController();
  TextEditingController _fromPlaceController = TextEditingController();
  TextEditingController _toPlaceController = TextEditingController();
  TextEditingController _kiloMeterController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _purposeController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _wheelerTypeController = TextEditingController();
  TextEditingController _travelTypeController = TextEditingController();
  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;
  String selectedOption = 'Option 1';
  int? selectedTravelType;
  String? selectedWayType;
  int? selectedFuelType;
  String? selectedWheelType;
  // String? selectedFuelWheelerType;
  bool isFuel = false;
  bool isTravel = false;
  bool isStay = false;
  CroppedFile? cropimage;
  List<String> certificateImages = [""];
  int? imageLength;
  String? userId;
  ReimbursementListObject? reimbursementData;
  List<CertificateImageObject> imageList = [];
  

  @override
  Widget build(BuildContext context) {
    return

      BlocProvider(
        create: (context) {
          var bloc = SalaryBloc();

          bloc.add(GetReimbursementDetailsEvent(context, widget.reimbursementID));
          return bloc;
        },
        child: BlocListener<SalaryBloc, SalaryState>(
          listener: (context, state) {
            if(state is GetReimbursementDetailSuccessState){
              print(" success state data");
              print(state.data['data']);
              reimbursementData = ReimbursementListObject.fromJson(state.data['data']);
              print("reimbursementData!.purpose");
              print(reimbursementData!.reasonType);

              _ReasonTypeController.text = reimbursementData!.reasonType;
              _dateController.text = reimbursementData!.forDate!;
              _kiloMeterController.text = reimbursementData!.kilometer;
              _toPlaceController.text = reimbursementData!.toPlace;
              _fromPlaceController.text = reimbursementData!.fromPlace;
              _travelTypeController.text = reimbursementData!.wayType;
              _wheelerTypeController.text = reimbursementData!.wheelerType;
              print("$_selectedDay dayyy");
              print("$_selectedMonth month");
              // _selectedMonth = DateTime(int.parse(reimbursementData!.forDate!)).month;
              // _selectedYear = DateTime(int.parse(reimbursementData!.forDate!)).year;
              _amountController.text = reimbursementData!.amount;
              imageList.clear();
              for(int i=0; i < state.data['data']['documents'].length; i++){
                imageList.add( CertificateImageObject.fromJson(state.data['data']['documents'][i]));
              }


            }
            if(state is GetReimbursementDetailErrorState){
              print("${state.error} error state");
            }
          },
          child: BlocBuilder<SalaryBloc, SalaryState>(
            builder: (context, state) {
              return  Scaffold(
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
                          text: 'REIMBURSEMENT',
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                          letterSpacing: 0.2),
                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Gap(2.h),

                        Row(
                          children: [
                            CommonUI().myText(text: "Reason"),
                            CommonUI().myText(text: '*', color: AppTheme.primaryColor2),
                          ],
                        ),
                        Gap(1.h),

                        CommonUI.formField(
                            editingController: _ReasonTypeController,
                            hinttext: '',
                            enabled: false),
                        Gap(2.h),
                        // isTravel
                        reimbursementData!= null? reimbursementData!.reasonType =="travel"?
                        CommonUI.formField(
                            editingController: _travelTypeController,
                            hinttext: '',
                            enabled:  false)
                            :SizedBox():
                        SizedBox(),
                        // isFuel
                        Row(
                          children: [
                            CommonUI().myText(text: "Vehicle"),

                          ],
                        ),
                        Gap(1.h),
                        reimbursementData != null ?      reimbursementData!.reasonType =="Fuel"?

                        CommonUI.formField(
                            editingController: _wheelerTypeController,
                            hinttext: '',
                            enabled: false)
                        // Column(
                        //   children: [
                        //     Row(
                        //       children: [
                        //         ButtonBar(
                        //           // alignment: MainAxisAlignment.center,
                        //
                        //           children: <Widget>[
                        //             SizedBox(
                        //               width: 38.w,
                        //               child: Row(
                        //                 children: [
                        //                   Radio(
                        //                     value: 1,
                        //                     groupValue: selectedFuelType,
                        //                     activeColor: AppTheme.primaryColor2,
                        //                     onChanged: (val) {
                        //                       print("Radio $val");
                        //                       selectedWheelType = "two";
                        //                       // setSelectedFuelRadio(val!);
                        //                     },
                        //                   ),
                        //                   CommonUI()
                        //                       .myText(text: "Two Wheeler", fontSize: 10.sp),
                        //                 ],
                        //               ),
                        //             ),
                        //             Row(
                        //               children: [
                        //                 Radio(
                        //                   value: 2,
                        //                   groupValue: selectedFuelType,
                        //                   activeColor: AppTheme.primaryColor2,
                        //                   onChanged: (val) {
                        //                     print("Radio $val");
                        //                     // setSelectedFuelRadio(val!);
                        //                     selectedWheelType = "four";
                        //                   },
                        //                 ),
                        //                 CommonUI()
                        //                     .myText(text: "Four Wheeler", fontSize: 10.sp),
                        //               ],
                        //             ),
                        //             // Row(
                        //             //   children: [
                        //             //     Radio(
                        //             //       value: 3,
                        //             //       groupValue: selectedFuelType,
                        //             //       activeColor: AppTheme.primaryColor2,
                        //             //       onChanged: (val) {
                        //             //         print("Radio $val");
                        //             //         setSelectedFuelRadio(val!);
                        //             //         selectedTravel = "train";
                        //             //       },
                        //             //     ),
                        //             //     CommonUI()
                        //             //         .myText(text: "Train", fontSize: 10.sp),
                        //             //   ],
                        //             // ),
                        //             // Row(
                        //             //   children: [
                        //             //     Radio(
                        //             //       value: 4,
                        //             //       groupValue: selectedFuelType,
                        //             //       activeColor: AppTheme.primaryColor2,
                        //             //       onChanged: (val) {
                        //             //         print("Radio $val");
                        //             //         setSelectedFuelRadio(val!);
                        //             //         selectedTravel = "bus";
                        //             //       },
                        //             //     ),
                        //             //     CommonUI()
                        //             //         .myText(text: "bus", fontSize: 10.sp),
                        //             //   ],
                        //             // ),
                        //             // Row(
                        //             //   children: [
                        //             //     Radio(
                        //             //       value: 5,
                        //             //       groupValue: selectedFuelType,
                        //             //       activeColor: AppTheme.primaryColor2,
                        //             //       onChanged: (val) {
                        //             //         print("Radio $val");
                        //             //         setSelectedFuelRadio(val!);
                        //             //         selectedTravel = "auto";
                        //             //       },
                        //             //     ),
                        //             //     CommonUI()
                        //             //         .myText(text: "Auto", fontSize: 10.sp),
                        //             //   ],
                        //             // ),
                        //             // Row(
                        //             //   children: [
                        //             //     Radio(
                        //             //       value: 5,
                        //             //       groupValue: selectedFuelType,
                        //             //       activeColor: AppTheme.primaryColor2,
                        //             //       onChanged: (val) {
                        //             //         print("Radio $val");
                        //             //         setSelectedFuelRadio(val!);
                        //             //         selectedTravel = "others";
                        //             //       },
                        //             //     ),
                        //             //     CommonUI()
                        //             //         .myText(text: "Others", fontSize: 10.sp),
                        //             //   ],
                        //             // ),
                        //           ],
                        //         ),
                        //       ],
                        //     )
                        //     ,
                        //
                        //     Align(
                        //         alignment: Alignment.topLeft,
                        //         child: CommonUI().myText(
                        //           text: "Kilometer",
                        //         )),
                        //     Gap(2.h),
                        //     CommonUI.formField(
                        //         editingController: _kiloMeterController,
                        //         hinttext: '',
                        //         enabled: true),
                        //
                        //   ],
                        // )
                            :SizedBox()
                        :
                        SizedBox(),
                        // isStay

                        Gap(2.h),
                        reimbursementData != null ?   reimbursementData!.reasonType =="stay"?
                        Column(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: CommonUI().myText(
                                  text: "Location",
                                )),
                            Gap(2.h),
                            CommonUI.formField(
                                editingController: _locationController,
                                hinttext: '',
                                enabled: true),

                            Gap(2.h),

                            Align(
                                alignment: Alignment.topLeft,
                                child: CommonUI().myText(
                                  text: "Purpose",

                                )),
                            Gap(2.h),
                            CommonUI.formField(
                              editingController: _purposeController,
                              hinttext: '',
                              enabled: true,
                            ),

                          ],
                        )
                            :SizedBox()
                        :SizedBox(),

                        //by default fields
                        Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: CommonUI().myText(
                              text: "Date",
                            )),
                        Gap(1.h),

                        CommonUI.formField(
                            editingController: _dateController,
                            hinttext: '',
                            enabled: false),

                        Gap(2.h),


                        Align(
                            alignment: Alignment.topLeft,
                            child: CommonUI().myText(
                              text: "Amount",
                            )),
                        Gap(2.h),
                        CommonUI.formField(
                            editingController: _amountController,
                            hinttext: '',
                            enabled: false),
                        Gap(2.h),
                        for(var index = 0;
                        index <  (imageList.length ?? 1);
                        index++)
                          Container(
                            height: 25.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Image.network(imageList[index].mediaUrl),
                          ),
                        Gap(6.h),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     CommonUI.buttonContainer(
                        //         height: 5.h,
                        //         width: 23.w,
                        //         onPressed: (){
                        //
                        //           var payload = CreateReimbursementObject(
                        //               reasonType: _ReasonTypeController.text.trim(),
                        //               wayType: selectedWayType != null ?   selectedWayType! : null ,
                        //               wheelerType: selectedWheelType != null? selectedWheelType! : null,
                        //               kilometer: _kiloMeterController.text.trim(),
                        //               fromPlace: _fromPlaceController.text.trim(),
                        //               toPlace: _toPlaceController.text.trim(),
                        //               amount: _amountController.text.trim(),
                        //               forDate: DateTime(_selectedYear!, _selectedMonth!, _selectedDay!),
                        //               userId: userId.toString()!);
                        //           BlocProvider.of<SalaryBloc>(context)
                        //               .add(CreateReimbursementEvent(context, certificateImages, payload));
                        //
                        //         },
                        //         file: Center(
                        //             child:
                        //             CommonUI().myText(
                        //                 text: "SUBMIT",
                        //                 fontSize: 11.sp,
                        //                 color: AppTheme.whiteColor
                        //
                        //             )))
                        //   ],
                        // ),
                        // Gap(2.h)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );

  }
}
