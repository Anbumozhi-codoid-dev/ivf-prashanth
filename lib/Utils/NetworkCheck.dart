

import 'AllImports.dart';


class networkCheck{
Future<void> checkinternetconnectivity() async {
  bool _hasInternet=true;
  InternetConnectionChecker().onStatusChange.listen((status) {

    _hasInternet = status == InternetConnectionStatus.connected;
    if (!_hasInternet) {
      showDialog(
        context: AppDataHelper.rootContext!,
        builder: (context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Center(child: CommonUI().myText(text: "IVF - Prashanth Hospital",color: AppTheme.textPink)),
          content: CommonUI().myText(text: 'Please check your internet connection and try again',maxLines:  4,textAlign: TextAlign.center),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                SystemChannels.platform
                    .invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        ),
      );
    }

  });

}
}