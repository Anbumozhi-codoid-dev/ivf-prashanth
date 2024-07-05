

import '../../../Utils/AllImports.dart';

class HowFeelingPage extends StatefulWidget {
  HowFeelingPage({super.key, required this.firstname});
  String firstname;

  @override
  State<HowFeelingPage> createState() => _HowFeelingPageState();
}

class _HowFeelingPageState extends State<HowFeelingPage> {
  List<String> questionsList = ['Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, String 3',
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, String 4'];

  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    bool isTablet = isTabletDevice(context); // Use the utility function

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 15.h,
              width: 100.w,
              decoration: const BoxDecoration(
                  color: AppTheme.themePink,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
              child: Center(
                child: CommonUI().myText(
                    text:
                        "How are Feeling, ${widget.firstname.toString().substring(0)[0].toUpperCase() + widget.firstname.toString().substring(1)}?",
                    color: AppTheme.white,
                    fontSize: 16.sp,
                    fontfamily: "Nunito",
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              height: 70.h,
              child: ListView.builder(
                  itemCount: questionsList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap:(){
                            print(index);
                            setState(() {
                              selectedIndex = index;

                            });

                        },
                          child: Container(
                            height: 13.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              color:
                                  selectedIndex == index?
                                      AppTheme.themePink
                                  :
                              AppTheme.formFieldGrey,
                              borderRadius: BorderRadius.circular(10)
                            ),

                            child: Padding(
                              padding:  EdgeInsets.fromLTRB(3.w,0,0,0),
                              child: Align(
                                alignment: Alignment.center,
                                child: CommonUI().myText(
                                    fontSize: isTablet ? 11.sp : 12.sp,
                                    text: questionsList[index],
                                overflow: TextOverflow.visible,
                                maxLines: 3),
                              ),
                            ),

                          ),
                        ),
                        Gap(2.h)
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoardScreen()));
            },
            child: CommonUI().myText(text: "Skip",color: AppTheme.textPink,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600),
          ),
          Gap(50.w),
          GestureDetector(
              onTap: (){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MenstrualCalendarPage()));
              },
              child: Image.asset(AppConstants.circleArrowIcon, scale: isTablet ? 3 : 4.5,))
        ],
      ),
    );
  }
}
