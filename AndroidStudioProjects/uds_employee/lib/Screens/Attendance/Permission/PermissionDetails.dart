import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uds_employee/Allnavigations/AllNavigationsDirectory.dart';
import 'package:uds_employee/Allnavigations/AllimportedDirectory.dart';
import 'package:uds_employee/Bloc/PermissionBloc.dart';

import '../../../Allnavigations/AllBlocDirectory.dart';

class PermissionDetailsScreen extends StatefulWidget {
   PermissionDetailsScreen({Key? key,required this.PermissionId}) : super(key: key);
   String PermissionId;

  @override
  State<PermissionDetailsScreen> createState() => _PermissionDetailsScreenState();
}

class _PermissionDetailsScreenState extends State<PermissionDetailsScreen> {
  TextEditingController _dateController=TextEditingController();
  TextEditingController _hoursControiller=TextEditingController();
  TextEditingController _fromTimeController=TextEditingController();
  TextEditingController _toTimeController=TextEditingController();
  TextEditingController _notesController=TextEditingController();
  PermissionData? _permissionData;
  @override
  Widget build(BuildContext context) {
    return
    BlocProvider(create: (context){
      var bloc=PermissionBloc();
     bloc.add(PermissionDetailsEvent(widget.PermissionId, context));
      return bloc;

    },
      child: BlocListener<PermissionBloc,PermissionState>(
        listener: (context,state){
          if(state is PermissionDetailsSuccessState){
            print(state);
            print(state.data);
            _permissionData=PermissionData.fromJson(state.data['data']);

            _dateController.text=_permissionData!.forDate.toString().split(' ')[0];

            _fromTimeController.text=_permissionData!.fromTime;
            _toTimeController.text=_permissionData!.toTime;
            _notesController.text=_permissionData!.notes;


            DateTime startTime = DateFormat("HH:mm:ss").parse(_permissionData!.fromTime);
            DateTime endTime = DateFormat("HH:mm:ss").parse(_permissionData!.toTime);

            // Calculate the time difference
            Duration difference = endTime.difference(startTime);

            String formatDuration(Duration duration) {
              int hours = duration.inHours;
              int minutes = duration.inMinutes % 60;

              if (hours > 0 && minutes > 0) {
                return '$hours hour $minutes minutes';
              } else if (hours > 0) {
                return '$hours hour';
              } else {
                return '$minutes minutes';
              }
            }
            _hoursControiller.text=formatDuration(difference);



          }

        },
        child: BlocBuilder<PermissionBloc,PermissionState>(
          builder: (context,state){
            return
            state is PermissionDetailsSuccessState
              ?

              Scaffold(
              backgroundColor: AppTheme.whiteColor,
              appBar: AppBar(

                automaticallyImplyLeading: false,
                backgroundColor: AppTheme.whiteColor,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                title: CommonUI().myText(text: "PERMISSION"),


              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _buildbody(context),

                    ],
                  ),
                ),
              ),
            )
                : _buildShimmer(context)
            ;
          },
        ),
      ),
    );

  }
  Widget _buildbody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonUI().myText(text: "Date",),
          Gap(2.h),
          CommonUI.formField(editingController: _dateController, hinttext: '',enabled: false),
          Gap(2.h),
          CommonUI().myText(text: "Hours"),
          Gap(2.h),
          CommonUI.formField(editingController: _hoursControiller, hinttext: '',enabled: false),
          Gap(2.h),
          CommonUI().myText(text: "Timing"),
          Gap(2.h),
          Row(
            children: [
              SizedBox(width : 35.w,child: CommonUI.formField(editingController: _fromTimeController, hinttext: '',enabled: false)),
              Gap(4.w),
              CommonUI().myText(text: 'to'),
              Gap(4.w),
              SizedBox(width : 35.w,child: CommonUI.formField(editingController: _toTimeController, hinttext: '',enabled: false)),
            ],
          ),
          Gap(2.h),
          CommonUI().myText(text: "Notes",fontWeight: FontWeight.w500,fontSize: 16.sp),
          Gap(2.h),
          CommonUI.textAreaFormField(editingController: _notesController,
              enabled: false,
              hinttext: '',maxLines: 10,fillcolor: Colors.grey[200]!),
          Gap(2.h),
          Row(
            children: [
              CommonUI().myText(text: "Status: "),
              Gap(1.w),
              CommonUI().myText(text: _permissionData!.status[0].toUpperCase() + _permissionData!.status.substring(1) ,color: AppTheme.presentColor)
            ],
          ),
          Gap(2.h),
          Row(
            children: [
              CommonUI().myText(text: "Applied Date: "),
              Gap(1.w),
              CommonUI().myText(text: _permissionData!.createdAt.toString().split('T')[0])
            ],
          ),
          Gap(2.h),
          Row(
            children: [
              CommonUI().myText(text: "Approved Date: "),
              Gap(1.w),
              CommonUI().myText(text:_permissionData!.approvedDate.toString() !="null" ? _permissionData!.approvedDate.toString().split('T')[0] : "-")
            ],
          ),
          Gap(2.h),


        ],
      ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: (Colors.grey)!,
      highlightColor: (Colors.grey)!,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5, // Number of shimmering items
        itemBuilder: (context, index) {
          return Material(
            type: MaterialType.card,
            color: AppTheme.whiteColor,
            child: ListTile(
              title: Container(
                width: double.infinity,
                height: 15.h,
                color: Colors.white, // Placeholder color
              ),
            ),
          );
        },
      ),
    );
  }
}
