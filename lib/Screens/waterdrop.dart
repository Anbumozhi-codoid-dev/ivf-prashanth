import '../Utils/AllImports.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.4183333,size.height*0.8685714);
    path_0.lineTo(size.width*0.3741667,size.height*0.7885714);
    path_0.lineTo(size.width*0.3700000,size.height*0.7057143);
    path_0.lineTo(size.width*0.3958333,size.height*0.6128571);
    path_0.lineTo(size.width*0.4266667,size.height*0.5585714);
    path_0.lineTo(size.width*0.4466667,size.height*0.5085714);
    path_0.lineTo(size.width*0.4775000,size.height*0.5685714);
    path_0.lineTo(size.width*0.4966667,size.height*0.6114286);
    path_0.lineTo(size.width*0.5083333,size.height*0.6414286);
    path_0.lineTo(size.width*0.5191667,size.height*0.6628571);
    path_0.lineTo(size.width*0.5283333,size.height*0.6985714);
    path_0.lineTo(size.width*0.5341667,size.height*0.7371429);
    path_0.lineTo(size.width*0.5316667,size.height*0.7757143);
    path_0.lineTo(size.width*0.5233333,size.height*0.8085714);
    path_0.lineTo(size.width*0.5133333,size.height*0.8371429);
    path_0.lineTo(size.width*0.5000000,size.height*0.8600000);
    path_0.lineTo(size.width*0.4850000,size.height*0.8757143);
    path_0.lineTo(size.width*0.4633333,size.height*0.8828571);
    path_0.lineTo(size.width*0.4433333,size.height*0.8828571);
    path_0.lineTo(size.width*0.4291667,size.height*0.8800000);
    path_0.lineTo(size.width*0.4183333,size.height*0.8685714);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paint_stroke_0);


    // Layer 1

    Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_1 = Path();
    path_1.moveTo(size.width*0.4166667,size.height*0.8700000);

    canvas.drawPath(path_1, paint_fill_1);


    // Layer 1

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_1, paint_stroke_1);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
