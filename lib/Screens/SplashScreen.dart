
import 'package:ivf/Utils/AppConstants.dart';
import 'package:ivf/Utils/CommonUI.dart';

import '../Utils/AllImports.dart';
import 'SingupPage/SkipPages/samplecalendar.dart';
import 'WelcomePage/WelcomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3)); // Duration of the splash screen
    Navigator.of(context).pushReplacement(
      CustomPageRoute(
        child: CustomCalendar(),
        // child: MenstrualCalendarPage(),
        // child: WelcomePage(),
        begin: Offset(1.0, 0.0),
        end: Offset.zero,
        duration: 1,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppConstants.prashanthLogo,
              scale: 3,),
              Gap(2.h),
              CommonUI().myText(text: "Prashanth Fertility App",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPink)

            ],
          ),
        ),
      ),
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final Offset begin;
  final Offset end;
  final int duration;

  CustomPageRoute({
    required this.child,
    required this.begin,
    required this.end,
    required this.duration,
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var beginOffset = begin;
      var endOffset = end;
      var tween = Tween(begin: beginOffset, end: endOffset);
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: Duration(seconds: duration),
  );
}

//
// import 'dart:async';
//
// import 'package:vcount/Screens/DashBoard.dart';
//
// import '../../Utils/AllImports.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   // String? gettoken;
//   //
//   // Future<String?> getToken() async{
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String? token = prefs.getString('token'); //getting token from localstorage
//   //   gettoken = token;
//   //   return token;
//   //
//   // }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // getToken();
//     // navigationPage();
//     startTime();
//
//   }
//   startTime() async {
//     var duration = const Duration(seconds: 3);
//     return Timer(duration, navigationPage);
//   }
//
//   Future<void> navigationPage() async {
//
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) =>  DashBoardScreen()),
//     );
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return   AnnotatedRegion(
//       value: SystemUiOverlayStyle.light
//           .copyWith(statusBarColor: AppTheme.primaryColor2),
//       child: Scaffold(
//
//         body:
//         Container(
//           decoration:  BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.white, Colors.blue[100]!],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: Center(
//               child: Padding(
//                 padding:  EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     CommonUI().verticleAlign(height: 20.h),
//                     // Image.asset(AppConstant.vcountLogo),
//                     CommonUI().verticleAlign(height: 1.h),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         CommonUI().myText(text: "Welcome to VCOUNT",
//
//                             fontSize: 7.sp,color: AppTheme.black),
//                         CommonUI().verticleAlign(height: 15.h)
//
//
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//           ),
//         ),
//       ),
//     );
//   }
// }
