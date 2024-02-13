import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:uds_employee/Utils/AppAlertController.dart';

import '../../../Allnavigations/AllBlocDirectory.dart';
import '../../../Allnavigations/AllimportedDirectory.dart';
import '../../../Bloc/LeaveBloc.dart';
import '../../../Utils/AppTheme.dart';

class LeaveCancelPage extends StatefulWidget {
  LeaveCancelPage({super.key, this.startDate,
    this.endDate, this.leaveType});

  String? startDate;
  String? endDate;
  String? leaveType;

  @override
  State<LeaveCancelPage> createState() => _LeaveCancelPageState();
}

class _LeaveCancelPageState extends State<LeaveCancelPage> {
  TextEditingController _cancelReasonController = TextEditingController();
  TextEditingController _numberOfDayController = TextEditingController();
  List<DateTime> days = [];
  List<DateTime> selectedDates = [];
  DateTime? startDate;
  DateTime? endDate;
  String? userId;
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("widget.startDate");
    print(widget.startDate);
    print(widget.endDate.runtimeType);
    getDate();
    getUserId();
    getToken();
  }
  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('id')!;
    });
    print("$userId userid");
  }
  getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token =prefs.getString('token')!;
    });
  }

  // getDate(){
  //
  //  if( widget.endDate != null){
  //     endDate =  DateTime.parse(widget.endDate!);
  //     startDate = DateTime.parse(widget.startDate!);
  //    var length = endDate?.difference(startDate!).inDays;
  //
  //    for(int i =0; i<= length!; i++){
  //      days.add(startDate!.add(Duration(days: i)));
  //    }
  //  }
  //  else if(widget.endDate == null){
  //    days.add(startDate!);
  //  }
  //
  //
  //
  //   print("days.length");
  //   print(days.length);
  //   print(days[0]);
  //
  // }
  getDate() {
    if (widget.startDate != null) {
      startDate = DateTime.parse(widget.startDate!);
      days.add(startDate!); // Always add the start date

      if (widget.endDate != "null") {
        endDate = DateTime.parse(widget.endDate!);
        var length = endDate!.difference(startDate!).inDays;

        for (int i = 1; i <= length; i++) {
          days.add(startDate!.add(Duration(days: i)));
        }
      }
    } else {
      // Handle the case where the start date is null (you may want to throw an error or handle it differently)
      // For now, let's just print an error message
      print("Error: Start date is null");
    }
  }

  bool areDatesConsecutive(List<DateTime> dates) {
    for (int i = 0; i < dates.length - 1; i++) {
      if (dates[i].add(Duration(days: 1)) != dates[i + 1]) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = LeaveBloc();

        return bloc;
      },
      child: BlocListener<LeaveBloc, LeaveState>(
        listener: (context, state) {

          if(state is CancelLeaveSuccessState){
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
                      text: 'Cancel requested successfully!!',
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
        },
        child: BlocBuilder<LeaveBloc, LeaveState>(
          builder: (context, state) {
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
                      text: "Cancel Leave",
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Gap(2.h),
                      Align(
                          alignment: Alignment.topLeft,
                          child: CommonUI().myText(text: "Reason")),
                      Gap(1.5.h),
                      CommonUI.formField(
                        editingController: _cancelReasonController,
                        hinttext: '',
                        enabled: true,
                      ),
                      Gap(4.h),
                      Align(
                          alignment: Alignment.topLeft,
                          child:
                              CommonUI().myText(text: "Select Date to cancel")),
                      Gap(1.5.h),
                      ListView.builder(
                        itemCount: days.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          DateTime currentDate = days[index];
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(currentDate);

                          return ListTile(
                            title: Row(
                              children: [
                                selectedDates.contains(currentDate)
                                    ? Icon(
                                        Icons.circle_rounded,
                                        color: AppTheme.primaryColor2,
                                      )
                                    : Icon(Icons.circle_outlined),
                                Gap(4.w),
                                Text(formattedDate),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                if (selectedDates.contains(currentDate)) {
                                  selectedDates.remove(currentDate);
                                  print("currentDate");
                                  print(currentDate);
                                } else {
                                  selectedDates.add(currentDate);
                                  print("currentdate else");
                                  print(currentDate);
                                }
                              });
                            },
                            // tileColor: selectedDates.contains(currentDate)
                            //     ? Colors.blue.withOpacity(0.3)
                            //     : null,
                          );
                        },
                      ),
                      Gap(3.h),
                      CommonUI.buttonContainer(
                          height: 4.h,
                          width: 20.w,
                          onPressed: () {
                            print("selectedDates.toString()");
                            // print(selectedDates.toString());
                            // print(selectedDates.length);
                            // print(selectedDates.first.toString().split(" ")[0]);
                            // print(selectedDates.last.toString().split(" ")[0]);
                            // // print(_cancelReasonController.text);


                            if(selectedDates.isNotEmpty && _cancelReasonController.text.isNotEmpty){
                              var data = CancelLeaveObject(
                                fromDate: selectedDates.length > 1 ? selectedDates.first.toString().split(" ")[0] : selectedDates.first.toString().split(" ")[0],
                                toDate: selectedDates.length >1 ? selectedDates.last.toString().split(" ")[0] : null,
                                requestType: "cancel",
                                leaveType: widget.leaveType.toString(),
                                notes:  _cancelReasonController.text.trim(),
                                userId: userId!,
                              );


                              BlocProvider.of<LeaveBloc>(context).add(CancelLeaveEvent(data, token!, context));

                            }
                            else{
                              AppAlertController().showAlert(message: "fill all fields", inContext: context);
                            }

                          },
                          file: Center(
                              child: CommonUI().myText(
                                  text: "Submit", color: AppTheme.whiteColor)))
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
