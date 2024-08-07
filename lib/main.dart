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
  Future.delayed(const Duration(seconds: 1), () {
    networkCheck().checkinternetconnectivity();

  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Delay assignment to ensure context is available
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   AppDataHelper.rootContext = context;
    // });
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


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(builder: (context, orientation, deviceType) {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'IVF-Prashanth Fertility',
//
//         navigatorKey: AppDataHelper.navKey,
//         theme: ThemeData(
//           primarySwatch: buildMaterialColor(AppTheme.themeBlue),
//           popupMenuTheme: const PopupMenuThemeData(
//             surfaceTintColor: AppTheme.pageBackgroundWhite,
//             color: AppTheme.pageBackgroundWhite, // Set the background color here
//           ),
//         ),
//         home: SplashScreen(), // Initial screen
//       );
//     });
//   }
// }







// import 'package:flutter/cupertino.dart';
// import 'Utils/AllImports.dart';
//
// bool notificationRoute= false;
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//   runApp(const MyApp());
//   // NotificationHandler.appInOpen();
//   // NotificationHandler.appInBackground();
//   // NotificationHandler.appInTerminated();
//   // networkCheck().checkinternetconnectivity();
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return  Sizer(
//         builder: (context, orientation, deviceType) {
//           return
//             MaterialApp(
//               navigatorKey: AppDataHelper.navKey,
//               debugShowCheckedModeBanner: false,
//               title: 'vcount',
//               initialRoute: "/",
//               routes: {
//                 // When navigating to the "/" route, build the FirstScreen widget.
//                 '/': (context) => SplashScreen(),
//                 // When navigating to the "/second" route, build the SecondScreen widget.
//                 // '/login': (context) => const LoginPage(),
//                 // // '/dashboard': (context) => const BottomNavigation(),
//                 // '/dashboard': (context) =>  DashboardScreen(),
//               },
//               theme: ThemeData(
//                 colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: const Color(0xFF761322)).copyWith(secondary: const Color(0xFF761322)),
//               ),
//               // home: const SplashScreen(),
//             );
//         }
//
//
//     );
//   }
// }
//
//







// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
