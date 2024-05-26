import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/screens/mini_projects/clocky/theme_data.dart';

class ClockView extends StatefulWidget {
  final double size;

  // Define a named parameter 'size' in the constructor
  const ClockView({Key? key, required this.size}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override void initState(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Transform.rotate(
          angle: -pi/2,
          child: CustomPaint(
            painter:
              ClockPainter()
            ),
        ),
      ),
    );
  }
}


class ClockPainter extends CustomPainter {
  var datetime=DateTime.now();
  //60sec= 360 degree, 1 sec= 6 degree
  //12 hours= 360 degree, 1 hour=30 degrees, 1 min=0.5 degrees
  @override
  void paint(Canvas canvas, Size size) {
    var centerX=size.width/2;
    var centerY=size.height/2;
    var center=Offset(centerX, centerY);
    var radius= min(centerX, centerY);

    var fillBrush=Paint()
    ..color=CustomColors.menuBackgroundColor;

    var outlineBrush=Paint()
    ..color=const Color(0xFFEAECFF)
    ..style =PaintingStyle.stroke
    ..strokeWidth=16;

    var centerFillBrush=Paint()
    ..color=const Color(0xFFEAECFF);

    var hourhandBrush=Paint()
      ..color=const Color(0xFFEAECFF)
      ..shader=const RadialGradient(colors: [Colors.yellow,Colors.pink]).
      createShader(Rect.fromCircle(center: center, radius: radius))
      ..style =PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth=size.width/24;

    var minhandBrush=Paint()
    ..shader=const RadialGradient(colors: [Colors.redAccent,Colors.pink]).
    createShader(Rect.fromCircle(center: center, radius: radius))
      ..color=const Color(0xFFEAECFF)
      ..style =PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth=size.width/30;

    var sechandBrush=Paint()
      ..color=CustomColors.secHandColor!
      ..style =PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth=size.width/60;

    // var dashBrush=Paint()
    //   ..color = Color(0xFFEAECFF)
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round
    //   ..strokeWidth = 1;





    canvas.drawCircle(center, radius*0.75, fillBrush);
    canvas.drawCircle(center, radius*0.75, outlineBrush);

    var secHandX =centerX+radius*0.6*cos(datetime.second*6*pi/180);
    var secHandY =centerX+radius*0.6*sin(datetime.second*6*pi/180);


    canvas.drawLine(center, Offset(secHandX, secHandY), sechandBrush);

    var minHandX =centerX+radius*0.6*cos(datetime.minute*6*pi/180);
    var minHandY =centerX+radius*0.6*sin(datetime.minute*6*pi/180);

    canvas.drawLine(center, Offset(minHandX, minHandY), minhandBrush);

    var hourHandX =centerX+radius*0.4*cos((datetime.hour*30+datetime.minute*0.5)*pi/180);
    var hourHandY =centerX+radius*0.4*sin((datetime.hour*30+datetime.minute*0.5)*pi/180);

    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourhandBrush);
    canvas.drawCircle(center, radius*0.12, centerFillBrush);

    // var outerCircleradius=radius;
    // var innerCircleRadius= radius-14;
    // for(double i=0;i<360;i+=12){
    //   // var x1= centerX+outerCircleradius*cos(i*pi/180);
    //   // var y1= centerX+outerCircleradius*sin(i*pi/180);
    //   //
    //   // var x2= centerX+innerCircleRadius*cos(i*pi/180);
    //   // var y2= centerX+innerCircleRadius*sin(i*pi/180);
    //
    //   // canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    // }



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}