import 'package:flutter/cupertino.dart';
import 'AllImports.dart';

class CommonUI {




  Widget buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: (Colors.grey[300])!,
      highlightColor: (Colors.grey[100])!,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5, // Number of shimmering items
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              width: double.infinity,
              height: 15.h,
              color: Colors.white, // Placeholder color
            ),
          );
        },
      ),
    );
  }

  Widget myTabText({
    required String text,
    double fontSize = 15,
    double letterSpacing = 15,
    TextAlign? textAlign = TextAlign.start,
    fontWeight = FontWeight.w500,
    TextOverflow overflow = TextOverflow.ellipsis,
    int maxLines = 0,
    String fontfamily = 'PTR',
    double lineHeight = 0.0,
  }) {
    var letterspacing = letterSpacing == 15 ? 0.3.sp : letterSpacing;
    return MediaQuery(
      data: MediaQuery.of(AppDataHelper.rootContext!)
          .copyWith(textScaleFactor: 1.0),
      child: Text(
        text,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines == 0 ? null : maxLines,
        style: TextStyle(
            fontFamily: fontfamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
            height: lineHeight,
            letterSpacing: letterspacing),
      ),
    );
  }

  static Widget textFormField1(
      {required String hintText,
      Widget? child,
      EdgeInsetsGeometry? contentPadding =
          const EdgeInsets.only(left: 30, top: 7),
      double? fontsize = 25,
      String? fontfamily = "PTR",
      String? Function(String?)? validator,
      void Function(String?)? onchanged,
      TextInputType? keyboardType,
      required bool show,
      bool isPrefix = false,
      Widget? suffixIcon,
      double? hintfontsize = 20,
      TextEditingController? controller,
      FocusNode? focusNode}) {
    return TextFormField(
      controller: controller,
      onChanged: onchanged,
      focusNode: focusNode,
      style: TextStyle(
          fontSize: 25,
          color: const Color.fromRGBO(42, 42, 42, 1),
          fontFamily: fontfamily),
      obscureText: show,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        border: InputBorder.none,
        hintText: hintText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
        prefixIcon: isPrefix
            ? Padding(
                padding: const EdgeInsets.only(top: 13),
                child: child,
              )
            : const SizedBox(),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }

  static Widget contain({
    double? height,
    double? width,
    Widget? child,
  }) {
    return Container(
      alignment: Alignment.center,
      height: height?.h,
      width: width?.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black.withOpacity(0.075),
          boxShadow: const [
            BoxShadow(
                color: Colors.white,
                offset: Offset(3, 3),
                blurRadius: 3,
                spreadRadius: -3),
          ]),
      child: child,
    );
  }

  static Widget filterHeaderContainer(
      {double? height,
      double? width,
      Widget? child,
      Color? color = AppTheme.white}) {
    return Container(
      width: 19.w,
      height: 4.5.h,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
      child: child,
    );
  }



  static Widget shimmer({
    required String text,
    required double size,
    String? fontfamily = "SFPro",
    FontWeight? font,
  }) {
    return Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.blue,
        child: Text(text,
            style: TextStyle(
                fontSize: size,
                fontFamily: fontfamily,
                color: Colors.black,
                fontWeight: font)));
  }

  static Widget textWidget(
      {required String text,
      double? size,
      Color? color,
      FontWeight? font,
      TextOverflow? overflow,
      String? fontfamily = "SFPro",
      int? maxline,
      TextAlign? textAlign,
      FontStyle? fontStyle}) {
    return Text(
      text,
      // textDirection: textDirection!,
      textAlign: textAlign,
      maxLines: maxline,
      style: TextStyle(
        fontSize: size,
        fontFamily: fontfamily,
        fontStyle: fontStyle,
        color: color,
        fontWeight: font,
      ),
      overflow: overflow,
    );
  }

  static Widget selectableText({
    required String text,
    required double size,
    Color? color,
    FontWeight? font,
    String? fontfamily,
    TextOverflow? overflow,
    int? maxline,
    TextAlign? textAlign,
    double? ls,
  }) {
    return SelectableText(
      text!,
      textAlign: textAlign,
      maxLines: maxline,
      style: TextStyle(
          fontSize: size,
          fontFamily: fontfamily,
          color: color,
          fontWeight: font,
          letterSpacing: ls),
    );
  }





  Widget myText({
    required String text,
    double fontSize = 15,
    double letterSpacing = 15,
    TextAlign? textAlign = TextAlign.start,
    FontStyle? fontStyle = FontStyle.normal,
    fontWeight = FontWeight.w500,
    color = Colors.black,
    TextOverflow overflow = TextOverflow.ellipsis,
    int maxLines = 0,
    String fontfamily = 'Nunito',
    double lineHeight = 0.0,
  }) {
    var letterspacing = letterSpacing == 15 ? 0.3.sp : letterSpacing;
    return MediaQuery(
      data: MediaQuery.of(AppDataHelper.rootContext!)
          .copyWith(textScaleFactor: 1.0),
      child: Text(
        text,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines == 0 ? null : maxLines,
        style: TextStyle(
            color: color,
            fontFamily: fontfamily,
            fontStyle: fontStyle,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
            height: lineHeight,
            letterSpacing: letterspacing),
      ),
    );
  }


  Widget buttonContainer({
    Color? color = AppTheme.white,
    double height = 7,
    double width = 100,
    Widget? child,

  }){

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color
      ),
      child: child,
    );
  }

  Widget textFormField({
    double height = 7,
    double width = 100,
    required String hintText,
    Widget? child,
    int? maxLines = 1,
    EdgeInsetsGeometry? contentPadding =
        const EdgeInsets.only(left: 30, top: 7),
    double? fontsize = 25,
    String? fontfamily = "Nunito",
    String? Function(String?)? validator,
    void Function(String?)? onchanged,
    TextInputType? keyboardType,
    required bool show,
    bool isPrefix = false,
    Widget? suffixIcon,
    double? hintfontsize = 20,
    double? contentpadding =15,
    TextEditingController? controller,
    FocusNode? focusNode,
    AutovalidateMode? autovalidate,
    int? maxLength = 50,
    bool enabled = false
  }) {
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        enabled: enabled,

        controller: controller,
        onChanged: onchanged,
        focusNode: focusNode,
        maxLines: maxLines,
        maxLength: maxLength,

        autovalidateMode: autovalidate,
        style: TextStyle(
            fontSize: fontsize,
            color: const Color.fromRGBO(42, 42, 42, 1),
            fontFamily: fontfamily),

        obscureText: show,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          counterText: "",
          // constraints: BoxConstraints(minHeight: 30.h),
          fillColor: AppTheme.formFieldGrey,
          errorStyle: TextStyle(fontSize: hintfontsize, color: AppTheme.bloodRed, height: 0.5.h),
          contentPadding:
              EdgeInsets.fromLTRB(1.w, 1.h, 5, 5), // Adjust padding to fit height
          // contentPadding: EdgeInsets.all(contentpadding!), // Adjust padding to fit height
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,

             ),
          focusedErrorBorder:  OutlineInputBorder(
            gapPadding: 10.h,
            borderSide:  BorderSide(color: AppTheme.themePink, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
              // borderSide: BorderSide(
              //   // color: Colors.yellow,
              //   color: AppTheme.borderGrey!,
              //   // width: 10.w
              // ),
              borderRadius: BorderRadius.circular(5)),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
              // borderSide: BorderSide(color: AppTheme.borderGrey!, width: 1.0),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none
            // borderSide: BorderSide(color: AppTheme.themeBlue, width: 1.0),
          ),
          // enabledBorder: const UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.yellow),
          // ),
          // focusedBorder: const UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.transparent),
          // ),
          hintStyle:
              TextStyle(color: AppTheme.borderGrey,
                  wordSpacing: 0.5.w,
                  fontSize: hintfontsize),
          // prefixIcon: isPrefix
          //     ? Padding(
          //         padding: const EdgeInsets.only(top: 13),
          //         child: child,
          //       )
          //     : const SizedBox(),
          // suffixIcon: suffixIcon,
        ),
        validator: validator,
        //
        // decoration: InputDecoration(
        //     border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(10)
        //
        //     )
        // ),
      ),
    );
  }


}

class TooltipShape extends ShapeBorder {
  const TooltipShape();

  final BorderSide _side = BorderSide.none;
  final BorderRadiusGeometry _borderRadius = BorderRadius.zero;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(_side.width);

  @override
  Path getInnerPath(
    Rect rect, {
    TextDirection? textDirection,
  }) {
    final Path path = Path();

    path.addRRect(
      _borderRadius.resolve(textDirection).toRRect(rect).deflate(_side.width),
    );

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    final RRect rrect = _borderRadius.resolve(textDirection).toRRect(rect);

    path.moveTo(0, 10);
    path.quadraticBezierTo(0, 0, 10, 0);
    path.lineTo(rrect.width - 30, 0);
    path.lineTo(rrect.width - 20, -10);
    path.lineTo(rrect.width - 10, 0);
    path.quadraticBezierTo(rrect.width, 0, rrect.width, 10);
    path.lineTo(rrect.width, rrect.height - 10);
    path.quadraticBezierTo(
        rrect.width, rrect.height, rrect.width - 10, rrect.height);
    path.lineTo(10, rrect.height);
    path.quadraticBezierTo(0, rrect.height, 0, rrect.height - 10);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => RoundedRectangleBorder(
        side: _side.scale(t),
        borderRadius: _borderRadius * t,
      );
}

class CustomPageRoute extends PageRouteBuilder {
  final Offset begin;
  final Offset end;
  final Widget child;
  final int duration;

  CustomPageRoute(
      {required this.begin,
      required this.end,
      required this.child,
      required this.duration})
      : super(
          transitionDuration: Duration(seconds: duration),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: Curves.easeIn),
            );
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
