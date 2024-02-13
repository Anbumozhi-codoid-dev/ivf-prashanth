import 'dart:io';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:uds_employee/Bloc/SalaryBloc.dart';
import 'package:uds_employee/Screens/Salary/Reimbursement/ReimbursementList.dart';
import 'package:uds_employee/Utils/AppAlertController.dart';

import '../../../Allnavigations/AllBlocDirectory.dart';
import '../../../Allnavigations/AllimportedDirectory.dart';
import '../../../Network/APIMethods.dart';
import '../../../Utils/AppConstant.dart';
import '../../../Utils/AppTheme.dart';
import '../../../Utils/CommonUI.dart';

class ReimbursementForm extends StatefulWidget {
  const ReimbursementForm({super.key});

  @override
  State<ReimbursementForm> createState() => _ReimbursementFormState();
}

class _ReimbursementFormState extends State<ReimbursementForm> {
  TextEditingController _ReasonTypeController = TextEditingController();
  TextEditingController _fromPlaceController = TextEditingController();
  TextEditingController _toPlaceController = TextEditingController();
  TextEditingController _kiloMeterController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _purposeController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
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


  setSelectedTravelRadio(int val) {
    setState(() {
      selectedTravelType = val;
    });
  }
  setSelectedFuelRadio(int val) {
    setState(() {
      selectedFuelType= val;
    });
  }
  getUserId() async {
    print("get userid");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('id')!;
    });
    print('userid 67');
    print(userId);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }
  @override
  Widget build(BuildContext context) {
    return

      BlocProvider(
        create: (context) {
          var bloc = SalaryBloc();
          return bloc;
        },
        child: BlocListener<SalaryBloc, SalaryState>(
          listener: (context, state) {

            if (state is CreateReimbursementSuccessState) {
              print(state.data);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ReimbursementList()));
            }
            if(state is CreateReimbursementErrorState){
              print("$state error state ----94");
              AppAlertController().showAlert(message: state.error, inContext: context);
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
                        Row(
                          children: [
                            CommonUI().myText(text: "Reason"),
                            CommonUI().myText(text: '*', color: AppTheme.primaryColor2),
                          ],
                        ),
                        Gap(2.h),
                        TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: _ReasonTypeController,
                            style: TextStyle(
                                color: AppTheme.blackColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Metropolis'),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8, vertical: 7.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              helperStyle: const TextStyle(
                                  color: AppTheme.primaryColor2, fontFamily: 'Metropolis'),
                              suffixIcon: Image.asset(
                                AppConstant.downarrowicon,
                                scale: 1,
                                color: AppTheme.primaryColor2,
                              ),
                              hintText: 'Select Reason...',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          suggestionsCallback: (pattern) async {
                            return await _statefetchSuggestions(pattern);
                          },
                          itemBuilder: (context, suggestion) {
                            return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: ListTile(
                                    title: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(2.w, 0, 0, 0),
                                              child: Container(
                                                width: 70.w,
                                                child: CommonUI().myText(
                                                    text: suggestion,
                                                    maxLines: 2,
                                                    color: AppTheme.blackColor,
                                                    fontSize: 12.sp),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(
                                          endIndent: 0,
                                        )
                                      ],
                                    )));
                          },
                          suggestionsBoxDecoration: SuggestionsBoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppTheme.whiteColor,
                              elevation: 4.0),
                          onSuggestionSelected: (suggestion) {
                            _stateonItemSelected(suggestion, context);
                          },
                          noItemsFoundBuilder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Container(
                                    height: 60.h,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          AppConstant.noDataIcon,
                                          width: 80.w,
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          },
                        ),
                        // isTravel
                        _ReasonTypeController.text =="travel"?   Column(
                          children: [
                            Row(
                              children: [
                                ButtonBar(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 30.w,
                                      child: Row(
                                        children: [
                                          Radio(
                                            value: 0,
                                            groupValue: selectedTravelType,
                                            activeColor: AppTheme.primaryColor2,
                                            onChanged: (val) {
                                              print("Radio $val");
                                              selectedWayType = "one";
                                              setSelectedTravelRadio(val!);
                                            },
                                          ),
                                          CommonUI().myText(text: "One Way", fontSize: 10.sp),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 2,
                                          groupValue: selectedTravelType,
                                          activeColor: AppTheme.primaryColor2,
                                          onChanged: (val) {
                                            print("Radio $val");
                                            setSelectedTravelRadio(val!);
                                            selectedWayType = "round";
                                          },
                                        ),
                                        CommonUI().myText(text: "Round Trip", fontSize: 10.sp),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: CommonUI().myText(
                                text: "From Place",
                              ),
                            ) ,
                            Gap(2.h),
                            CommonUI.formField(
                                editingController: _fromPlaceController,
                                hinttext: '',
                                enabled: true),
                            Gap(2.h),
                            Align(
                                alignment: Alignment.topLeft,
                                child: CommonUI().myText(
                                  text: "To Place",
                                )),
                            Gap(2.h),
                            CommonUI.formField(
                                editingController: _toPlaceController,
                                hinttext: '',
                                enabled: true),

                          ],
                        )
                            :SizedBox(),
                        // isFuel
                        _ReasonTypeController.text =="Fuel"?
                        Column(
                          children: [
                            Row(
                              children: [
                                ButtonBar(
                                  // alignment: MainAxisAlignment.center,

                                  children: <Widget>[
                                    SizedBox(
                                      width: 38.w,
                                      child: Row(
                                        children: [
                                          Radio(
                                            value: 1,
                                            groupValue: selectedFuelType,
                                            activeColor: AppTheme.primaryColor2,
                                            onChanged: (val) {
                                              print("Radio $val");
                                              selectedWheelType = "two";
                                              setSelectedFuelRadio(val!);
                                            },
                                          ),
                                          CommonUI()
                                              .myText(text: "Two Wheeler", fontSize: 10.sp),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 2,
                                          groupValue: selectedFuelType,
                                          activeColor: AppTheme.primaryColor2,
                                          onChanged: (val) {
                                            print("Radio $val");
                                            setSelectedFuelRadio(val!);
                                            selectedWheelType = "four";
                                          },
                                        ),
                                        CommonUI()
                                            .myText(text: "Four Wheeler", fontSize: 10.sp),
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Radio(
                                    //       value: 3,
                                    //       groupValue: selectedFuelType,
                                    //       activeColor: AppTheme.primaryColor2,
                                    //       onChanged: (val) {
                                    //         print("Radio $val");
                                    //         setSelectedFuelRadio(val!);
                                    //         selectedTravel = "train";
                                    //       },
                                    //     ),
                                    //     CommonUI()
                                    //         .myText(text: "Train", fontSize: 10.sp),
                                    //   ],
                                    // ),
                                    // Row(
                                    //   children: [
                                    //     Radio(
                                    //       value: 4,
                                    //       groupValue: selectedFuelType,
                                    //       activeColor: AppTheme.primaryColor2,
                                    //       onChanged: (val) {
                                    //         print("Radio $val");
                                    //         setSelectedFuelRadio(val!);
                                    //         selectedTravel = "bus";
                                    //       },
                                    //     ),
                                    //     CommonUI()
                                    //         .myText(text: "bus", fontSize: 10.sp),
                                    //   ],
                                    // ),
                                    // Row(
                                    //   children: [
                                    //     Radio(
                                    //       value: 5,
                                    //       groupValue: selectedFuelType,
                                    //       activeColor: AppTheme.primaryColor2,
                                    //       onChanged: (val) {
                                    //         print("Radio $val");
                                    //         setSelectedFuelRadio(val!);
                                    //         selectedTravel = "auto";
                                    //       },
                                    //     ),
                                    //     CommonUI()
                                    //         .myText(text: "Auto", fontSize: 10.sp),
                                    //   ],
                                    // ),
                                    // Row(
                                    //   children: [
                                    //     Radio(
                                    //       value: 5,
                                    //       groupValue: selectedFuelType,
                                    //       activeColor: AppTheme.primaryColor2,
                                    //       onChanged: (val) {
                                    //         print("Radio $val");
                                    //         setSelectedFuelRadio(val!);
                                    //         selectedTravel = "others";
                                    //       },
                                    //     ),
                                    //     CommonUI()
                                    //         .myText(text: "Others", fontSize: 10.sp),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ],
                            )
                            ,

                            Align(
                                alignment: Alignment.topLeft,
                                child: CommonUI().myText(
                                  text: "Kilometer",
                                )),
                            Gap(2.h),
                            CommonUI.formField(
                                editingController: _kiloMeterController,
                                hinttext: '',
                                enabled: true),

                          ],
                        )
                            :SizedBox(),
                        // isStay

                        Gap(2.h),
                        _ReasonTypeController.text =="stay"?     Column(
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
                            :SizedBox(),

                        //by default fields
Gap(2.h),
                        Align(
                            alignment: Alignment.topLeft,
                            child: CommonUI().myText(
                              text: "Date",
                            )),
                        Gap(1.h),

                        DropdownDatePicker(
                          // inputDecoration: InputDecoration(
                          //   border: BorderSide.none
                          // ),
                          boxDecoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(6.0),
                              color: AppTheme.grey.withOpacity(0.1)),

                          locale: "en",

                          isDropdownHideUnderline:
                          true, // optional
                          isFormValidator: true, // optional
                          startYear: 1900, // optional
                          endYear: 2024, // optional
                          width: 16, // optional
                          selectedDay: _selectedDay, // optional
                          selectedMonth:
                          _selectedMonth, // optional
                          selectedYear:
                          _selectedYear, // optional
                          onChangedDay: (value) {
                            _selectedDay = int.parse(value!);
                            print('onChangedDay: $value');
                          },
                          onChangedMonth: (value) {
                            _selectedMonth = int.parse(value!);
                            print('onChangedMonth: $value');
                          },
                          onChangedYear: (value) {
                            _selectedYear = int.parse(value!);
                            print('onChangedYear: $value');

                            // calculateAge(  DateTime(_selectedYear!, _selectedMonth!, _selectedDay!));
                          },
                          // boxDecoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(6),
                          //   color: AppTheme.FieldGrey,
                          // ), // optional
                          showDay: true,
                          monthFlex: 4, // optional
                          dayFlex: 3,
                          yearFlex: 4,// optional
                          hintDay: 'Day', // optional
                          hintMonth: 'Month', // optional
                          hintYear: 'Year', // optional
                          hintTextStyle: TextStyle(
                              color: Colors.grey), // optional
                        ),
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
                            enabled: true),
                        Gap(2.h),
                        for(var index = 0;
                        index <  (imageLength ?? 1);
                        index++)
                          _buildCertificateImage(index),
                        Gap(2.h),

                        Row(
                          children: [
                            CommonUI().myText(text: "JPG and PDF images only Supported.", fontSize: 9.sp),
                            Gap(20.w),
                            GestureDetector(
                              onTap: (){
                                print("length1");
                                print(certificateImages.length);
                                setState(() {
                                  certificateImages.add("");
                                  imageLength = certificateImages.length!;


                                });
                                print("length2");
                                print(certificateImages.length);
                                print(imageLength);

                              },
                              child: Row(
                                children: [
                                  CommonUI().myText(text: "Add",
                                      color: AppTheme.primaryColor2,
                                      fontSize: 9.sp),
                                  Icon(Icons.add_circle,
                                    size: 15.sp,
                                    color: AppTheme.primaryColor2,)
                                ],
                              ),
                            )

                          ],
                        ),
                        Gap(6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CommonUI.buttonContainer(
                                height: 5.h,
                                width: 23.w,
                                onPressed: (){

                                  var payload = CreateReimbursementObject(
                                      reasonType: _ReasonTypeController.text.trim(),
                                      wayType: selectedWayType != null ?   selectedWayType! : null ,
                                      wheelerType: selectedWheelType != null? selectedWheelType! : null,
                                      kilometer: _kiloMeterController.text.trim(),
                                      fromPlace: _fromPlaceController.text.trim(),
                                      toPlace: _toPlaceController.text.trim(),
                                      amount: _amountController.text.trim(),
                                      forDate: DateTime(_selectedYear!, _selectedMonth!, _selectedDay!),
                                      userId: userId.toString()!);
                                  BlocProvider.of<SalaryBloc>(context)
                                      .add(CreateReimbursementEvent(context, certificateImages, payload));

                                },
                                file: Center(
                                    child:
                                    CommonUI().myText(
                                        text: "SUBMIT",
                                        fontSize: 11.sp,
                                        color: AppTheme.whiteColor

                                    )))
                          ],
                        ),
                        Gap(2.h)
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



  Widget _buildCertificateImage(int index){
    Future.delayed(Duration(seconds: 2), (){

    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Row(
         children: [
           CommonUI().myText(text: 'Upload Supporting Documents',fontSize: 12.sp),
           Gap(20.w),
           GestureDetector(
             onTap: (){
               print(" remove length");
               print(certificateImages.length);
               print("index");
               print(index);
               setState(() {
                 certificateImages.removeAt(index);
                 // imageLength= certificateImages.length;
                 imageLength= (imageLength! - 1)!;
               });

             },
             child: Container(
                 height: 5.h,
                 width: 5.w,
                 child: Icon(Icons.clear, color: AppTheme.primaryColor2,)),
           ),
         ],
       ),
        Gap(2.h),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: GestureDetector(
                onTap: (){

                  openImagePickerOptions(context, index);
                },
                child:
                certificateImages[index] !='' ?
                // networkImage[index] ?

                Container(
                  height: 14.h,
                  width: 40.w,
                  decoration: BoxDecoration(


                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppTheme.grey,  // Border color
                      width: 0.5,           // Border width
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200]!,
                        blurRadius: 12.0,
                        spreadRadius: 2.0,
                        offset: Offset(0, 3), // Changes the shadow position
                      ),
                    ],
                  ),
                  child:   certificateImages[index].split('.').last.toLowerCase() == 'pdf'?
    Icon(Icons.picture_as_pdf)
    :
    // Image.network(certificateImages[index])
                  Image.file(

                              File(certificateImages[index]))
                  ,


                )
                    :
                certificateImages[index].split('.').last.toLowerCase()== 'pdf'?
                Container(
                  height: 14.h,
                  width: 40.w,
                  decoration: BoxDecoration(


                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppTheme.grey,  // Border color
                      width: 0.5,           // Border width
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200]!,
                        blurRadius: 12.0,
                        spreadRadius: 2.0,
                        offset: Offset(0, 3), // Changes the shadow position
                      ),
                    ],
                  ),
                  child:  Icon(Icons.picture_as_pdf),




                )

                //     :
                // Container(
                //   height: 14.h,
                //   width: 40.w,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: FileImage(
                //
                //
                //           File(certificateImages[index]),
                //
                //
                //         ),
                //         fit: BoxFit.cover
                //     ) ,
                //     borderRadius: BorderRadius.circular(6),
                //     border: Border.all(
                //       color: AppTheme.grey,  // Border color
                //       width: 0.5,           // Border width
                //     ),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey[200]!,
                //         blurRadius: 12.0,
                //         spreadRadius: 2.0,
                //         offset: Offset(0, 3), // Changes the shadow position
                //       ),
                //     ],
                //   ),
                //
                //
                // )
    :


                CommonUI().imageUploadContainer(
                    height: 20.h,
                    width: 90.w,
                    typeText: "front"
                )
    )
            ),
          ),


      ],
    );
  }




  openImagePickerOptions(context, int index) async {
    await showCupertinoModalPopup(
      context: context!,
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () =>
                        openImagePicker(ImageResource.CAMERA, context, index),
                    child: Text('Camera')),
                CupertinoActionSheetAction(
                    onPressed: () =>
                        openImagePicker(ImageResource.GALLERY, context, index),
                    child: const Text('Gallery')),
              ],
            );
          }),
    );
  }



  openImagePicker(ImageResource resource, context, int index) {
    Navigator.pop(context, true);
    if (resource.name == "GALLERY") {
      _pickFile(index);
    }
    if(resource.name =="CAMERA"){
      ImagePicker()
          .pickImage(
          source: resource == ImageResource.CAMERA
              ? ImageSource.camera
              : ImageSource.gallery)
          .then((image) async {
        if (image != null) {
          final croppedFile = await ImageCropper().cropImage(
              sourcePath: image!.path,
              compressFormat: ImageCompressFormat.jpg,
              compressQuality: 100,
              uiSettings: [
                AndroidUiSettings(
                  toolbarTitle: 'Cropper',
                  toolbarColor: Colors.deepOrange,
                  toolbarWidgetColor: Colors.white,
                  initAspectRatio: CropAspectRatioPreset.original,
                  lockAspectRatio: false,
                ),
                IOSUiSettings(
                  title: 'Cropper',
                ),
                WebUiSettings(
                  context: context,
                  presentStyle: CropperPresentStyle.dialog,
                  boundary: const CroppieBoundary(
                    width: 520,
                    height: 520,
                  ),
                  viewPort: const CroppieViewPort(
                      width: 480, height: 480, type: 'circle'),
                  enableExif: true,
                  enableZoom: true,
                  showZoomer: true,
                ),
              ]);
          setState(() {
            cropimage = croppedFile;
            print("${cropimage!.path} croped image");
            certificateImages[index] = croppedFile!.path;

          });

          // medicalCertificate = croppedFile?.path;
          // networkImagePB = false;



          // print("imageprofile");
          // print(bankPassBookImage);





        }
      });
    }


  }


  Future<void> _pickFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null) {
      File pickedFile = File(result.files.single.path!);

      // Check if the selected file is an image
      if (pickedFile.path.toLowerCase().endsWith('.jpg') ||
          pickedFile.path.toLowerCase().endsWith('.jpeg') ||
          pickedFile.path.toLowerCase().endsWith('.png')) {
        final croppedFile = await ImageCropper().cropImage(
            sourcePath: pickedFile!.path,
            compressFormat: ImageCompressFormat.jpg,
            compressQuality: 100,
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Colors.deepOrange,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
              ),
              IOSUiSettings(
                title: 'Cropper',
              ),
              WebUiSettings(
                context: context,
                presentStyle: CropperPresentStyle.dialog,
                boundary: const CroppieBoundary(
                  width: 520,
                  height: 520,
                ),
                viewPort: const CroppieViewPort(
                    width: 480, height: 480, type: 'circle'),
                enableExif: true,
                enableZoom: true,
                showZoomer: true,
              ),
            ]);

        if (croppedFile != null) {
          setState(() {
            cropimage = croppedFile;
          });

          certificateImages[index] = croppedFile.path;

          // medicalCertificate = croppedFile.path;
          //    networkImagePB = false;



        }
      } else if (pickedFile.path.toLowerCase().endsWith('.pdf')) {
        certificateImages[index] = pickedFile.path;

        // medicalCertificate = pickedFile.path;
        //networkImagePB = false;



      }
    } else {
      // User canceled the file picking
    }
  }

  Future<List<String>> _statefetchSuggestions(String input) async {
    input = input.toLowerCase();
    List<ReasonType> reasonType = [
      ReasonType(key: "Stay", type: "stay"),
      ReasonType(key: "Fuel", type: "fuel"),
      ReasonType(key: "Travel", type: "travel"),
      ReasonType(key: "Food", type: "food"),
    ];

    var _allReasons = reasonType.map((e) => e.type!).toList();
    input = input.toLowerCase();
    // setState(() {
    _allReasons =
        _allReasons.where((reason) => reason.toLowerCase().contains(input)).toList();
    // });

    return _allReasons;
  }

  void _stateonItemSelected(String suggestion, BuildContext context) async {
    // Call a geocoding API to get coordinates from the selected suggestion

    setState(() {
      _ReasonTypeController.text = suggestion;

    });

    for (int i = 0; i < reasonType.length; i++) {
      if (suggestion == reasonType[i].type) {
        setState(() {
          _ReasonTypeController.text = reasonType[i].type;
          // selectedleaveTypeID = leaveData[i].id;
          print('selectedleaveTypeID');
          // print(selectedleaveTypeID);
          // print(_leaveTypeController.text);

          // isSelected = true;
        });
      }
    }
  }
}
