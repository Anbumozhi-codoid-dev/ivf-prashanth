import 'AllImports.dart';

bool isTabletDevice(BuildContext context) {
  // SizerUtil.deviceType.name
  var shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide > 600;
}