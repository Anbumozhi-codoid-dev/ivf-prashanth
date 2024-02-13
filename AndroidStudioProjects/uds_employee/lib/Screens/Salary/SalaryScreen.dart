import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uds_employee/Allnavigations/AllNavigationsDirectory.dart';
import 'package:uds_employee/Utils/AppAlertController.dart';

import '../../Allnavigations/AllBlocDirectory.dart';
import '../../Allnavigations/AllimportedDirectory.dart';
import '../../Bloc/SalaryBloc.dart';
import '../RefCameraScreen.dart';
import 'Appraisal/AppraisalList.dart';
import 'PaySlip/PaySlipList.dart';
import 'Reimbursement/ReimbursementList.dart';
import 'Resign/NoDueForm.dart';
import 'Resign/ResignForm.dart';

class SalaryScreen extends StatefulWidget {
   SalaryScreen({Key? key,  this.userID}) : super(key: key);

   String? userID;
  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  String? userId;
  SalaryHomeObject? salaryHome;
  bool isResigned = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      getUserID();
  }
  getUserID() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
   userId = pref.getString('id');
    print("$userId userID124444");
  }

  @override
  Widget build(BuildContext context) {



    return BlocProvider(
        create: (context) {
          SalaryBloc bloc = SalaryBloc();
          print("userId-- $userId");
         Future.delayed(const Duration(seconds: 1),(){
           AppAlertController().showProgressIndicator(inContext: context);
            bloc.add(GetSalaryHomeApiEvent(context, userId));
          });
          return bloc;
        },
        child: BlocListener<SalaryBloc, SalaryState>(
            listener: (context, state) {
              if(state is GetSalaryHomeApiSuccessState){
                print("$state succ");
                print(state.data);
                AppAlertController().hideProgressIndicator();
                //
                salaryHome = SalaryHomeObject.fromJson(state.data['data']);
                print("salaryHome====");
                print(salaryHome);
                print("salaryHome!.resignId.isNotEmpty");
                print(salaryHome!.resignId.toString());
                print(salaryHome!.resignId.toString() != "null");
                if(salaryHome!.resignId.toString() != "null"){
                  setState(() {
                    isResigned = true;
                  });
                }
                else{
                  setState(() {
                    isResigned = false;
                  });
                }
                print("isResigned");
                print(isResigned);
              }
              if(state is GetSalaryHomeApiErrorState){
                print("$state errr");
              }



            }, child:
        BlocBuilder<SalaryBloc, SalaryState>(builder: (context, state) {

          return  SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PaySlipListPage()

                      ));                      },
                    child: SizedBox(
                      width: 90.w,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: AppTheme.themeLightGrey,width: 0.5)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(3.h,2.h,3.h,2.h),
                          child:
                          Row(
                            children: [
                              CommonUI().myText(text: "Pay Slip"),
                              Spacer(),
                              Image.asset(AppConstant.rightArrowIcon,scale: 3,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(1.h),
                  GestureDetector(
                   onTap: (){
                     Navigator.push(context,MaterialPageRoute(builder: (context)=> const ReimbursementList()));

                   },
                    child: SizedBox(
                      width: 90.w,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: AppTheme.themeLightGrey,width: 0.5)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(3.h,2.h,3.h,2.h),
                          child: Row(
                            children: [
                              CommonUI().myText(text: "Reimbursement"),
                              Spacer(),
                              Image.asset(AppConstant.rightArrowIcon,scale: 3,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(1.h),
                  GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => AppraisalList()));

                   },
                    child: SizedBox(
                      width: 90.w,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: AppTheme.themeLightGrey,width: 0.5)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(3.h,2.h,3.h,2.h),
                          child: Row(
                            children: [
                              CommonUI().myText(text: "Appraisal"),
                              Spacer(),
                              Image.asset(AppConstant.rightArrowIcon,scale: 3,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(1.h),
                  GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ResignForm(id: salaryHome!.resignId,)));

                  },
                    child: SizedBox(
                      width: 90.w,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: AppTheme.themeLightGrey,width: 0.5)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(3.h,2.h,3.h,2.h),
                          child:
                          Row(
                            children: [
                              CommonUI().myText(text: "Resign"),
                              Spacer(),
                              Image.asset(AppConstant.rightArrowIcon,scale: 3,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(1.h),
                  isResigned?
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> NoDueForm(noDueId: salaryHome!.noDueId, userID: userId,)));

                    },
                    child: SizedBox(
                      width: 90.w,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: AppTheme.themeLightGrey,width: 0.5)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(3.h,2.h,3.h,2.h),
                          child:
                          Row(
                            children: [
                              CommonUI().myText(text: "NoDue"),
                              Spacer(),
                              Image.asset(AppConstant.rightArrowIcon,scale: 3,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                      :
                  SizedBox()
                  //      :
                  // SizedBox()



                ],
              ),
            ),
          );
        })));

  }
}



//    return
//       FutureBuilder(
//         future: getUserID(),
//
//         builder:(context,snapshot){
//
//           if(snapshot.connectionState == ConnectionState.done){
//            return BlocProvider(
//                 create: (context) {
//                   SalaryBloc bloc = SalaryBloc();
//                   print("userId-- $userId");
//                   bloc.add(GetSalaryHomeApiEvent(context, userId));
//                   return bloc;
//                 },
//                 child: BlocListener<SalaryBloc, SalaryState>(
//                     listener: (context, state) {
//                       if(state is GetSalaryHomeApiSuccessState){
//                         print("$state succ");
//                         print(state.data);
//                         //
//                         salaryHome = SalaryHomeObject.fromJson(state.data['data']);
//                         print("salaryHome====");
//                         print(salaryHome);
//                         print(salaryHome!.resignId.isNotEmpty);
//                         if(salaryHome!.resignId.isNotEmpty){
//                          setState(() {
//                            isResigned = true;
//                          });
//                         }
//                         print("isResigned");
//                         print(isResigned);
//                       }
//                       if(state is GetSalaryHomeApiErrorState){
//                         print("$state errr");
//                       }
//
//
//
//                     }, child:
//                 BlocBuilder<SalaryBloc, SalaryState>(builder: (context, state) {
//
//                   return  SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//
//                           GestureDetector(
//                             onTap: (){
//                               //Navigator.push(context, MaterialPageRoute(builder: (context)=> RefCameraScreen()));
//                             },
//                             child: SizedBox(
//                               width: 90.w,
//                               child: Card(
//                                 elevation: 2,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5.0),
//                                     side: BorderSide(color: AppTheme.themeLightGrey,width: 0.5)
//                                 ),
//                                 child: Padding(
//                                   padding:  EdgeInsets.fromLTRB(3.h,2.h,3.h,2.h),
//                                   child:
//                                   GestureDetector(
//                                     onTap: (){
//
//                                       Navigator.push(context, MaterialPageRoute(
//                                           builder: (context) => PaySlipListPage()
//
//                                       ));                      },
//                                     child: Row(
//                                       children: [
//                                         CommonUI().myText(text: "Pay Slip"),
//                                         Spacer(),
//                                         Image.asset(AppConstant.rightArrowIcon,scale: 3,)
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Gap(1.h),
//                           SizedBox(
//                             width: 90.w,
//                             child: Card(
//                               elevation: 2,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5.0),
//                                   side: BorderSide(color: AppTheme.themeLightGrey,width: 0.5)
//                               ),
//                               child: Padding(
//                                 padding:  EdgeInsets.fromLTRB(3.h,2.h,3.h,2.h),
//                                 child: GestureDetector(
//                                   onTap: (){
//                                     Navigator.push(context,MaterialPageRoute(builder: (context)=> const ReimbursementList()));
//
//                                   },
//                                   child: Row(
//                                     children: [
//                                       CommonUI().myText(text: "Reimbursement"),
//                                       Spacer(),
//                                       Image.asset(AppConstant.rightArrowIcon,scale: 3,)
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Gap(1.h),
//                           SizedBox(
//                             width: 90.w,
//                             child: Card(
//                               elevation: 2,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5.0),
//                                   side: BorderSide(color: AppTheme.themeLightGrey,width: 0.5)
//                               ),
//                               child: Padding(
//                                 padding:  EdgeInsets.fromLTRB(3.h,2.h,3.h,2.h),
//                                 child: GestureDetector(
//                                   onTap: (){
//                                     Navigator.push(context, MaterialPageRoute(builder: (context) => AppraisalList()));
//
//                                   },
//                                   child: Row(
//                                     children: [
//                                       CommonUI().myText(text: "Appraisal"),
//                                       Spacer(),
//                                       Image.asset(AppConstant.rightArrowIcon,scale: 3,)
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Gap(1.h),
//                           SizedBox(
//                             width: 90.w,
//                             child: Card(
//                               elevation: 2,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5.0),
//                                   side: BorderSide(color: AppTheme.themeLightGrey,width: 0.5)
//                               ),
//                               child: Padding(
//                                 padding:  EdgeInsets.fromLTRB(3.h,2.h,3.h,2.h),
//                                 child:
//                                 GestureDetector(
//                                   onTap: (){
//                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> ResignForm(id: salaryHome!.resignId,)));
//                                   },
//                                   child: Row(
//                                     children: [
//                                       CommonUI().myText(text: "Resign"),
//                                       Spacer(),
//                                       Image.asset(AppConstant.rightArrowIcon,scale: 3,)
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Gap(1.h),
//                          isResigned?
//                          SizedBox(
//                             width: 90.w,
//                             child: Card(
//                               elevation: 2,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5.0),
//                                   side: BorderSide(color: AppTheme.themeLightGrey,width: 0.5)
//                               ),
//                               child: Padding(
//                                 padding:  EdgeInsets.fromLTRB(3.h,2.h,3.h,2.h),
//                                 child:
//                                 GestureDetector(
//                                   onTap: (){
//                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> NoDueForm(noDueId: salaryHome!.noDueId,)));
//                                   },
//                                   child: Row(
//                                     children: [
//                                       CommonUI().myText(text: "NoDue"),
//                                       Spacer(),
//                                       Image.asset(AppConstant.rightArrowIcon,scale: 3,)
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )
//                              :
//                          SizedBox()
//                          //      :
//                          // SizedBox()
//
//
//
//                         ],
//                       ),
//                     ),
//                   );
//                 })));
//           }
//           else{
//           return  CircularProgressIndicator();
//           }
//         }
//
//       );
//
//   }
// }