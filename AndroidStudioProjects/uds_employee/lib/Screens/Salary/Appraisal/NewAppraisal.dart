import 'package:sizer/sizer.dart';

import '../../../Allnavigations/AllBlocDirectory.dart';
import '../../../Allnavigations/AllimportedDirectory.dart';
import '../../../Utils/AppTheme.dart';
import '../../../Utils/CommonUI.dart';

class NewAppraisal extends StatefulWidget {
  const NewAppraisal({super.key});

  @override
  State<NewAppraisal> createState() => _NewAppraisalState();
}

class _NewAppraisalState extends State<NewAppraisal> {
  TextEditingController _expectationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.whiteColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 18.sp,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CommonUI().myText(
                text: 'NEW APPRAISAL',
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
                letterSpacing: 0.2),
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.fromLTRB(5.w,4.h,5.w,0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: CommonUI().myText(
                    text: "Expectation Appraisal",
                  )),
              Gap(2.h),
              CommonUI.formField(
                  editingController: _expectationController,
                  hinttext: '',
                  enabled: false),
              Gap(4.h),
              Align(
                  alignment: Alignment.topLeft,
                  child: CommonUI().myText(
                    text: "Notes",
                  )),
              Gap(2.h),
              CommonUI.textAreaFormField(
                  editingController: _expectationController,
                  hinttext: '',
                  enabled: false,
                  fillcolor: AppTheme.themeLightGrey.withOpacity(0.1),
                maxLines: 10


              ),
              Gap(5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonUI.buttonContainer(

                    height: 5.h,
                      width: 25.w,
                      onPressed:(){
                        
                      }, 
                      file: Center(child: CommonUI().myText(text: "APPLY",
                          fontSize: 12.sp,
                          color: AppTheme.whiteColor)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
