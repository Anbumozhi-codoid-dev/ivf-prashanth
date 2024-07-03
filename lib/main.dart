import 'package:ivf/Utils/NetworkCheck.dart';

import 'Screens/SplashScreen.dart';
import 'Utils/AllImports.dart';
import 'Utils/AppDataHelper.dart';
import 'Utils/AppTheme.dart';
import 'Utils/DeviceTab.dart';

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  networkCheck().checkinternetconnectivity();

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = isTabletDevice(context);

    print("isTablet----");
    print(isTablet);
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IVF-Prashanth Fertility',
        navigatorKey: AppDataHelper.navKey,
        theme: ThemeData(
          primarySwatch: buildMaterialColor(AppTheme.themeBlue),
          popupMenuTheme: const PopupMenuThemeData(
            surfaceTintColor: AppTheme.pageBackgroundWhite,
            color: AppTheme.pageBackgroundWhite, // Set the background color here
          ),
        ),
        home: SplashScreen(), // Initial screen
      );
    });
  }
}


