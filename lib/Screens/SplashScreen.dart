
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
    await Future.delayed(const Duration(seconds: 3)); // Duration of the splash screen
    Navigator.of(context).pushReplacement(
      CustomPageRoute(
        child: SingupForm(),
        // child:  WelcomePage(),
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
              CommonUI().myText(text: "Prashanth Fertility App1",
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

