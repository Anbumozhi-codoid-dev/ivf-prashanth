import 'AllImports.dart';

bool isTabletDevice(BuildContext context) {
  var shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide > 600;
}