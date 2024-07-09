import 'AllImports.dart';


class GradientCircularProgressIndicator extends StatelessWidget {
  final int? currentDay;

  GradientCircularProgressIndicator({required this.currentDay});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int totalDays = DateTime(now.year, now.month + 1, 0).day;
    int currentDaySafe = currentDay ?? 1; // Provide a default value if currentDay is null
    double progress = currentDaySafe / totalDays;

    return CircularPercentIndicator(
      radius: 70.0,
      lineWidth: 5.0,
      percent: progress,
      progressColor: AppTheme.themePink,
      backgroundColor: AppTheme.circleGrey,
      circularStrokeCap: CircularStrokeCap.round,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppConstants.bloodDropWhite, scale: 3,), // Replace with your image asset
      CommonUI().myText(text: "Day",
              color: AppTheme.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400
              ),
              CommonUI().myText(text: "01",
              color: AppTheme.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700
              ),

        ],
      ),
    );
  }
}



// class GradientCircularPercentIndicator extends StatelessWidget {
//   final double radius;
//   final double lineWidth;
//   final double percent;
//   final Color progressColor;
//   final List<Color> gradientColors;
//
//   const GradientCircularPercentIndicator({
//     Key? key,
//     required this.radius,
//     required this.lineWidth,
//     required this.percent,
//     required this.progressColor,
//     required this.gradientColors,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double outerRadius = radius + lineWidth;
//
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         // Grey circle
//         Container(
//           width: outerRadius * 2,
//           height: outerRadius * 2,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             // color: Colors.yellow,
//             color: Colors.grey.shade200,
//           ),
//         ),
//         // Gradient background circle
//         Container(
//           width: outerRadius * 2,
//           height: outerRadius * 2,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: LinearGradient(
//               colors: gradientColors,
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               // CircularPercentIndicator
//               CircularPercentIndicator(
//                 radius: radius,
//                 lineWidth: lineWidth,
//                 percent: percent,
//                 center: Text(
//                   "${(percent * 100).toInt()}%",
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 progressColor: Colors.red,
//                 backgroundColor: Colors.purple,
//                 circularStrokeCap: CircularStrokeCap.round,
//               ),
//             ],
//           ),
//         ),
//         // Green progress circle
//         CircularPercentIndicator(
//           radius: radius,
//           lineWidth: lineWidth,
//           percent: percent,
//           center: Text(
//             "${(percent * 100).toInt()}%",
//             style: TextStyle(
//               fontSize: 20.0,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           progressColor: progressColor,
//           backgroundColor: Colors.transparent,
//           circularStrokeCap: CircularStrokeCap.round,
//         ),
//       ],
//     );
//   }
// }

// class GradientCircularPercentIndicator extends StatelessWidget {
//   final double radius;
//   final double lineWidth;
//   final double percent;
//   final Color progressColor;
//   final List<Color> gradientColors;
//
//   const GradientCircularPercentIndicator({
//     Key? key,
//     required this.radius,
//     required this.lineWidth,
//     required this.percent,
//     required this.progressColor,
//     required this.gradientColors,
//   }) : super(key: key);
//
//   String getDayText(double percent) {
//     int day = (percent * 30).round(); // Assuming 30 days in a month
//     return '${day.toString().padLeft(2, '0')}';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double outerRadius = radius + lineWidth;
//
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         // Grey outer circle
//         Container(
//           width: outerRadius * 2,
//           height: outerRadius * 2,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.grey.shade200,
//           ),
//         ),
//         // Gradient background circle
//         Container(
//           width: radius * 2,
//           height: radius * 2,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: LinearGradient(
//               colors: gradientColors,
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         // Circular progress indicator with transparent background
//         CircularPercentIndicator(
//           radius: radius,
//           lineWidth: lineWidth,
//           percent: percent,
//           center: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(AppConstants.bloodDropWhite, scale: 2.8,),
//                 CommonUI().myText(text: "Day",
//                 color: AppTheme.white,
//                   fontSize: 11.sp,
//                   fontWeight: FontWeight.w400
//                 ),
//                 CommonUI().myText(text:  getDayText(percent),
//                 color: AppTheme.white,
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.w700
//                 ),
//               ],
//             ),
//           progressColor: progressColor,
//           backgroundColor: Colors.grey.shade200,
//           circularStrokeCap: CircularStrokeCap.round,
//         ),
//       ],
//     );
//   }
// }