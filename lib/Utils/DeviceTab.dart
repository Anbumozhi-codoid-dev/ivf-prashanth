import 'AllImports.dart';

bool isTabletDevice(BuildContext context) {
  // print( SizerUtil.deviceType == DeviceType.tablet);
  // // print(deviceName);
  var shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide > 600;
  }