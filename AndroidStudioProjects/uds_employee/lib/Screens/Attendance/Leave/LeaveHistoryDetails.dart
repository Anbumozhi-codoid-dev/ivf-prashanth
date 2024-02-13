import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uds_employee/Allnavigations/AllNavigationsDirectory.dart';
import 'package:uds_employee/Allnavigations/AllimportedDirectory.dart';
import 'package:uds_employee/Bloc/LeaveBloc.dart';
import 'package:uds_employee/Utils/AppAlertController.dart';

import '../../../Allnavigations/AllBlocDirectory.dart';
import '../../PDFScreen/PdfFileScreen.dart';
import 'LeaveCancelPage.dart';

class LeaveHistoryDetails extends StatefulWidget {
   LeaveHistoryDetails({Key? key,required this.leaveID}) : super(key: key);
  String leaveID;

  @override
  State<LeaveHistoryDetails> createState() => _LeaveHistoryDetailsState();
}

class _LeaveHistoryDetailsState extends State<LeaveHistoryDetails> {

  TextEditingController _leaveTypeController=TextEditingController();
  TextEditingController _leavestartController=TextEditingController();
  TextEditingController _leaveendController=TextEditingController();
  TextEditingController _noptesController=TextEditingController();
  bool checkedValue=false;
  LeaveStatusType? leavedetails;
  CertificateId? certificateId;
  String? pdfPath;



  String getFileNameFromUrl(String url) {
    Uri uri = Uri.parse(url);
    List<String> pathSegments = uri.pathSegments;

    // The last segment in the path is the file name
    String fileName = pathSegments.last;

    return fileName;
  }

  @override
  Widget build(BuildContext context) {
    return 
    BlocProvider(create: (context){
      var bloc=LeaveBloc();
      bloc.add(GetLeaveDetailsEvent(widget.leaveID, context));

      return bloc;

    },
      child: BlocListener<LeaveBloc,LeaveState>(
        listener: (context,state){
          if(state is GetLeaveDetailsSuccessState){
            print(state.data);
            leavedetails=LeaveStatusType.fromJson(state.data);

            if(state.data['certificate_id'] !=null){
              certificateId=CertificateId.fromJson(state.data['certificate_id']);
            }

            _leaveTypeController.text=leavedetails!.leaveType!.leaveType;
            _leavestartController.text=leavedetails!.fromDate.toString().split(' ')[0];
            checkedValue=leavedetails!.continueLeave;
            _leaveendController.text=leavedetails!.toDate.toString().split(' ')[0];
            _noptesController.text=leavedetails!.notes;



          }
        },
        child: BlocBuilder<LeaveBloc,LeaveState>(
          builder: (context,state){
            return
              


              Scaffold(
              appBar:
              AppBar(
                backgroundColor: AppTheme.whiteColor,
                automaticallyImplyLeading: false,
                elevation: 0,
                title: Row(
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios)),
                    Gap(2.w),
                    CommonUI().myText(text: "LEAVE DETAILS",
                    ),
                    Gap(19.w),
                    CommonUI.buttonContainer(

                      height: 3.5.h,
                        width: 20.w,

                        onPressed: (){
                          print("cancel button pressed");
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>
                              LeaveCancelPage(
                                startDate:  leavedetails!.fromDate.toString().split('T')[0] ?? "",
                                endDate:  leavedetails!.toDate.toString().split(' ')[0] ?? "",
                                leaveType: leavedetails!.leaveType.toString(),
                              )));
                        },
                        file:  Center(child: CommonUI().myText(text: "Cancel",
                        color: AppTheme.whiteColor
                        ))
                    )

                  ],
                ),
              ),
              body:


              state is GetLeaveDetailsSuccessState
              ?
                  SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      _leavehistory(context),

                    ],
                  ),
                ),
              ) : _buildShimmer(context),
            );
          },
        ),
      ),
    );
      
      

  }

  Widget _leavehistory(BuildContext context){
    return     Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonUI().myText(text: "Leave Type"),
        Gap(1.h),
        CommonUI.formField(editingController: _leaveTypeController, hinttext: '',enabled: false,
        ),
        Gap(1.6.h),
        CommonUI().myText(text: "Leave Date"),
        Gap(1.h),

        checkedValue==true
            ?
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CommonUI().myText(text: "From"),
        ):SizedBox(),
        Gap(1.h),
        CommonUI.formField(editingController: _leavestartController, hinttext: '',enabled: false,

            // sIcon: GestureDetector(
            //
            // onTap: (){
            // //  Navigator.push(context, MaterialPageRoute(builder: (context)=>CalenderScreen(value: "Leave")));
            // },
            // child: Image.asset(AppConstant.dateIcon,scale: 3,color: AppTheme.primaryColor2,))

        ),
        Gap(1.h),


        checkedValue
            ?Padding(
          padding: const EdgeInsets.all(8.0),
          child: CommonUI().myText(text: "To"),
        ):SizedBox(),
        Gap(1.h),
        checkedValue? CommonUI.formField(editingController: _leaveendController,enabled: false, hinttext: '',
          ):SizedBox(),
        Gap(1.h),
        Gap(1.h),
        CommonUI().myText(text: "Notes"),
        Gap(2.h),
        CommonUI.textAreaFormField(editingController: _noptesController, hinttext: 'xxxxxxxxx xxxxxx xxxxxx xxxxxx ',enabled:false,maxLines: 10,fillcolor: AppTheme.themeLightGrey.withOpacity(0.1)),
        Gap(5.h),
        certificateId !=null ? CommonUI().myText(text: "Medical Certificate Attachment"):SizedBox(),
        certificateId !=null ? Gap(2.h):SizedBox(),
        certificateId !=null ?

    Row(
    children: [
      CommonUI().myText(text: getFileNameFromUrl(certificateId!.mediaUrl),fontSize: 9.sp),
    Spacer(),



    certificateId!.mediaUrl.contains('.png') || certificateId!.mediaUrl.contains('.jpg')



    ? GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFScreen(url: certificateId!.mediaUrl,value:'image',)));
      },
      child: SizedBox(
          height:3.h,width:20.w,child: Image.network( certificateId!.mediaUrl)),
    ): certificateId!.mediaUrl.contains('.pdf') ?

      GestureDetector(

          onTap: (){

            createFileOfPdfUrl()
                .then((value) {
              setState(() {
                pdfPath = value.path;
              });
            });
            AppAlertController()
                .showProgressIndicator();

            Future.delayed(
                Duration(seconds: 5), () {
              AppAlertController()
                  .hideProgressIndicator();
              setState(() {
                Navigator.of(context).push(
                    CustomPageRoute(
                        begin: const Offset(
                            1.0, 0.0),
                        end: Offset.zero,
                        duration: 1,
                        child: PDFScreen(
                          pdfPath: pdfPath!,
                        )));
              });
            });

          },
          child: SizedBox(height:3.h,width:20.w,child: Image.asset(AppConstant.imageContainer))): SizedBox(),

      
      
    ],
    ) : SizedBox(),
        certificateId !=null ?     Gap(5.h):SizedBox(),

        Row(
          children: [
            CommonUI().myText(text: "Status:"),
            Gap(2.h),
            CommonUI().myText(text: leavedetails!.status !=null ? leavedetails!.status[0].toUpperCase() +  leavedetails!.status.substring(1): '',color: AppTheme.presentColor)
          ],
        ),
        Gap(3.h),
        Row(
          children: [
            CommonUI().myText(text: "Apply Date:"),
            Gap(2.h),
            CommonUI().myText(text: leavedetails!.createdAt.toString().split('T')[0],color: AppTheme.primaryColor2)
          ],
        ),
        Gap(3.h),
        Row(
          children: [
            CommonUI().myText(text: "Approved date on:"),
            Gap(2.h),
            CommonUI().myText(text: leavedetails!.approvedDate !=null ? leavedetails!.approvedDate.toString().split('T')[0] : "Still Pending",color: AppTheme.primaryColor2)
          ],
        )


      ],
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

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    try {
      final url =certificateId!.mediaUrl;
      final filename = url?.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url!));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');

    }

    return completer.future;
  }
}
