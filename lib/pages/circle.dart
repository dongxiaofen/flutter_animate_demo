
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class CancasCircle extends StatefulWidget {
  CancasCircle({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CancasCircleState createState() => _CancasCircleState();
}

class _CancasCircleState extends State<CancasCircle> with TickerProviderStateMixin {
    double percentage = 0.0;
    double newPercentage = 0.0;
    AnimationController percentageAnimationController;

    @override
    void initState() {
        super.initState();
        setState(() {
            percentage = 0.0;
        });
        percentageAnimationController = new AnimationController(
            vsync: this,
            duration: new Duration(milliseconds: 300)
        )
            ..addListener((){
              print('percentageAnimationController.value ${percentageAnimationController.value}');
              print('percentage $percentage');
                setState(() {
                    percentage = lerpDouble(percentage,newPercentage,percentageAnimationController.value);
                });
            });

    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: new Center(
              child: new Container(
                  height: 200.0,
                  width: 200.0,
                  child: new CustomPaint(
                      foregroundPainter: new MyPainter(
                          lineColor: Colors.lightBlueAccent,
                          completeColor: Colors.yellowAccent,
                          completePercent: percentage,
                          width: 8.0
                      ),
                      child: new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new RaisedButton(
                              color: Colors.green,
                              splashColor: Colors.transparent,
                              shape: new CircleBorder(),
                              child: new Text("Click"),
                              onPressed: (){
                                  setState(() {
                                    if (newPercentage == 100) {
                                      newPercentage = 0.0;
                                      percentage = 0.0;
                                    } else {
                                      percentage = newPercentage;
                                      newPercentage = 100;
                                    }
                                      // if(newPercentage>100.0){
                                      //     percentage=0.0;
                                      //     newPercentage=0.0;
                                      // }
                                      percentageAnimationController.forward(from: 0.0);
                                  });
                              }),
                      ),
                  ),
              ),
          ),
        );
    }
}

class MyPainter extends CustomPainter{
    Color lineColor;
    Color completeColor;
    double completePercent;
    double width;

    MyPainter({this.lineColor, this.completeColor, this.completePercent, this.width});
    @override
    void paint(Canvas canvas, Size size) {
        Paint line = Paint()
            ..color = lineColor
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.stroke
            ..strokeWidth = width;

        Paint complete = Paint()
            ..color = completeColor
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.stroke
            ..strokeWidth = width;

        Offset center = Offset(size.width/2, size.height/2);  //  坐标中心
        double radius = min(size.width/2, size.height/2);  //  半径
        canvas.drawCircle(//  画圆方法
            center,
            radius,
            line
        );

        double arcAngle = 2*pi*(completePercent / 100);

        canvas.drawArc(
            Rect.fromCircle(center: center, radius: radius),
            -pi/2,  //  从正上方开始
            arcAngle,
            false,
            complete
        );
    }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) => false;
}