import '../../Utils/AllImports.dart';
import 'package:intl/intl.dart';

enum AppLandingMenuList { HOME, STORE, CAMPAIGN, SETTINGS }

class DashBoardScreen extends StatefulWidget {
  int? index;
  String? firstName;
  DashBoardScreen({Key? key, this.index, this.firstName}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool selectedtab = false;
  TextEditingController? dropdownController;
  int? index1;
  String? userID;
  String? greetingString;
  List<String> screenTitle = [
    "Home",
    "Stores",
    "Campaign",
    'Settings',
  ];

  final List<Widget> _tabScreens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    // const CampaignList(),
    // const progressbar(),
    // const AttendanceScreen(),
    // SalaryScreen(),
    // //OnBoardingCompanyList(),
    // const ProfileScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: AppLandingMenuList.values.length,
      vsync: this,
    );

    greetingString =   getGreeting();
    _tabController!.index = (widget.index ?? 0)!;
    index1 = 0;
    //  AppAlertController().showProgressIndicator();
  }

  String getGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = isTabletDevice(context); // Use the utility function

    // var _allLanguages = languages.map((e) => e.language!).toList();
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar:
      AppBar(

        backgroundColor: AppTheme.themePink,
        centerTitle: true,
        automaticallyImplyLeading: false,

        toolbarHeight: 12.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            //  Radius.circular(12.h)
            bottomRight: Radius.circular(8.h),
            bottomLeft: Radius.circular(8.h),
          ),
        ),
        title:
        Padding(
          padding:  EdgeInsets.fromLTRB(2.h,0,2.w,3.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(AppConstants.profilePic,
              scale: isTablet ? 2.3 : 4,),
          Gap(3.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isTablet ? Gap(2.h)
              :
                  SizedBox(),
              CommonUI().myText(
                    text: greetingString! ,
                    color: AppTheme.white,
                    fontSize: 10.4.sp,
                    fontfamily: "Nunito",
                    fontWeight: FontWeight.w500),
              Gap(0.4.h),

              CommonUI().myText(
                    text:  widget.firstName != null ? '${widget.firstName!} !' : "" ,
                    color: AppTheme.white,
                    fontSize: 11.5.sp,
                    fontfamily: "Nunito",
                    fontWeight: FontWeight.w700),
              Gap(0.4.h),

              CommonUI().myText(
                  text: "( ${DateFormat("dd / MM / yyyy").format(DateTime.now())} )",
                color: AppTheme.white,
                fontSize: 8.sp,
                fontWeight: FontWeight.w600,
                fontfamily: "Nunito",

              )
            ],
          ),
             Gap(23.w),
              Image.asset(AppConstants.alarmIcon,
              scale: isTablet ? 2 :  5,
              ),
              Gap(2.w),

              Image.asset(
                AppConstants.prashanthLogo,
              scale: isTablet ?  4 :  8,
              ),


            ],
          ),
        )
        // CommonUI().myText(
        //     text: greetingString!,
        //     color: AppTheme.white,
        //     fontSize: 20.sp,
        //     fontfamily: "Nunito",
        //     fontWeight: FontWeight.w700),  

      ),

      body: WillPopScope(
          onWillPop: () async {
            if (_tabController!.index == 0) {
              showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    title: CommonUI().myText(
                        text: 'IVF-Prashanth',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor2),
                    actionsAlignment: MainAxisAlignment.end,
                    content: CommonUI().myText(
                        text: 'Are you sure want to exit?',
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center,
                        color: AppTheme.primaryColor2),
                    actions: [
                      TextButton(
                        onPressed: () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        },
                        child: CommonUI().myText(
                          text: 'YES',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: CommonUI().myText(
                          text: 'NO',
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              setState(() {
                _tabController!.index = 0;
              });
            }
            return Future(() => false);
          },
          child: _reloadingTabBarView),
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: _buildBottomTabBar,
      resizeToAvoidBottomInset: true,
    );
  }

  TabBarView get _reloadingTabBarView => TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: _tabScreens);
  void _handleTabBarSelection(int index) {
    setState(() {
      _tabController!.index = index;
      index1 = index;
    });
  }

  Widget get _buildBottomTabBar => Container(
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppTheme.LightGrey,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(0, 10), // Changes the shadow position
              ),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        constraints: BoxConstraints(
          minHeight: 5.h,
          maxHeight: 10.9.h,
        ),
        // decoration: _elevationShadow,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppTheme.LightGrey,
                blurRadius: 28,
              ),
            ],
          ),
          child: BottomNavigationBar(
            unselectedLabelStyle: TextStyle(
                color: AppTheme.blackColor,
                fontSize: 8.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6),
            selectedLabelStyle: TextStyle(
                color: AppTheme.blackColor,
                fontSize: 8.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6),
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            items: _bottomBarItems,
            currentIndex: _tabController!.index,
            backgroundColor: AppTheme.pageBackgroundWhite,
            onTap: (index) {
              _handleTabBarSelection(index);
            },
            selectedFontSize: 8.sp,

            // unselectedFontSize: 10.sp,
            // showUnselectedLabels: false,
            // showSelectedLabels: true,
            unselectedItemColor: AppTheme.blackColor,
            selectedItemColor: AppTheme.blackColor,
          ),
        ),
      );

  List<BottomNavigationBarItem> get _bottomBarItems {
    List<BottomNavigationBarItem> _tabItems = [];
    for (int idx = 0; idx < AppLandingMenuList.values.length; idx++) {
      var item = AppLandingMenuList.values[idx];
      var tab;
      if (idx == 1) {
        tab = BottomNavigationBarItem(
          backgroundColor: AppTheme.blackColor,
          icon: _bottomMenuIcon(
            item,
            idx == _tabController!.index,
            item.name,
          ),
          label: "",
        );
      } else if (idx == 3) {
        tab = BottomNavigationBarItem(
          icon: _bottomMenuIcon(item, idx == _tabController!.index, item.name),
          label: "",
          // label: selectedtab == false ? item.name : item.name,
        );
      } else if (idx == 2) {
        tab = BottomNavigationBarItem(
          icon: _bottomMenuIcon(item, idx == _tabController!.index, item.name),
          label: "",
        );
      } else {
        tab = BottomNavigationBarItem(
          icon: _bottomMenuIcon(item, idx == _tabController!.index, item.name),
          label: "",
        );
      }

      _tabItems.add(tab);
    }
    return _tabItems;
  }

  Widget _bottomMenuIcon(AppLandingMenuList item, bool isSelected, name) {
    var color = isSelected ? AppTheme.themePink : AppTheme.grey;
    var size = 20.sp;
    var iconName = isSelected ? "" : "";
    selectedtab = isSelected;
    switch (item) {
      case AppLandingMenuList.HOME:
        iconName = AppConstants.tick_Icon;
        break;
      case AppLandingMenuList.STORE:
        iconName = AppConstants.tick_Icon;
        break;
      case AppLandingMenuList.CAMPAIGN:
        iconName = AppConstants.tick_Icon;
        break;
      case AppLandingMenuList.SETTINGS:
        iconName = AppConstants.tick_Icon;
        break;
    }
    return Column(
      //  crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Material(
          elevation: 0,
          color: Colors.transparent,
          child: Container(
            // decoration: BoxDecoration(
            //   color: isSelected
            //       ? AppTheme.primaryColor2
            //       : Colors.transparent,
            //   border: Border.all(
            //     color: Colors.transparent,
            //
            //     width: 1.0,
            //   ),
            //   // borderRadius: BorderRadius.circular(5.0)
            //   borderRadius: const BorderRadius.only(
            //     bottomLeft: Radius.circular(8),
            //
            //     bottomRight:Radius.circular(8),
            //   ),
            //
            // ),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(iconName,
                    color: color, width: size.sp, height: size.sp),
              ],
            ),
          ),
        ),
      ],
    );
    //     :
    // Image.asset(iconName, color: color, width: size.sp, height: size.sp);
  }
}

class CustomPopupMenuDivider extends PopupMenuEntry<Null> {
  @override
  double get height => 16; // Height of the divider

  @override
  bool represents(void value) => false;

  @override
  State<StatefulWidget> createState() => _CustomPopupMenuDividerState();
}

class _CustomPopupMenuDividerState extends State<CustomPopupMenuDivider> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(
        endIndent: 0,
        indent: 0,
        color: AppTheme.black,
        thickness: 0.5,
      ),
    );
  }
}
