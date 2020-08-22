import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class ClipPathDemo extends StatefulWidget {
  ClipPathDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ClipPathDemoState createState() => _ClipPathDemoState();
}

class _ClipPathDemoState extends State<ClipPathDemo>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              height: 200,
              color: Colors.blue,
            ),
          ),
          // Container(
          //   height: 10,
          //   color: Colors.red,
          // ),
          ClipPath(
            clipper: CenterClipper(),
            child: Container(
              height: 20,
              width: 300,
              color: Colors.blue,
            ),
          ),
          Container(
            height: 10,
            // color: Colors.red,
          ),
          ClipPath(
            clipper: WaterClipper(),
            child: Container(
              width: 400,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); //第1个点
    path.lineTo(0, size.height - 50.0); //第2个点
    var firstControlPoint = Offset(size.width / 3, size.height);
    var firstEdnPoint = Offset(size.width, size.height - 50.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEdnPoint.dx, firstEdnPoint.dy);
    path.lineTo(size.width, size.height - 50.0); //第3个点
    path.lineTo(size.width, 0); //第4个点

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CenterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); //第1个点
    path.lineTo(size.width, 0); //第2个点
    var firstControlPoint = Offset(size.width - (size.height), size.height / 2);
    var firstEdnPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEdnPoint.dx, firstEdnPoint.dy);
    path.lineTo(size.width, size.height); //第3个点
    path.lineTo(0, size.height); //第4个点

    var secondControlPoint = Offset(size.height, size.height / 2);
    var secondEdnPoint = Offset(0, 0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEdnPoint.dx, secondEdnPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


class WaterClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path(); //定义路径
    //path.lineTo(0, 0); //第1个点
    //path.lineTo(0, size.height-50.0); //第2个点
    //var firstControlPoint = Offset(size.width/2, size.height); //第一段曲线控制点
    //var firstEdnPoint = Offset(size.width, size.height-50.0); //第一段曲线结束点
    //path.quadraticBezierTo( //形成曲线
    //  firstControlPoint.dx, 
    //  firstControlPoint.dy, 
    //  firstEdnPoint.dx, 
    //  firstEdnPoint.dy
    //);
    //path.lineTo(size.width, size.height-50.0); //第3个点
    //path.lineTo(size.width, 0); //第4个点

    //波浪曲线路径
    path.lineTo(0, 0); //第1个点
    path.lineTo(0, size.height - 40.0); //第2个点
    var firstControlPoint = Offset(size.width/4, size.height); //第一段曲线控制点
    var firstEndPoint = Offset(size.width/2.25, size.height-30); //第一段曲线结束点
    path.quadraticBezierTo( //形成曲线
      firstControlPoint.dx, 
      firstControlPoint.dy, 
      firstEndPoint.dx, 
      firstEndPoint.dy);
    
    var secondControlPoint = Offset(size.width/4*3, size.height-90); //第二段曲线控制点
    var secondEndPoint = Offset(size.width, size.height-40); //第二段曲线结束点
    path.quadraticBezierTo( //形成曲线
      secondControlPoint.dx, 
      secondControlPoint.dy, 
      secondEndPoint.dx, 
      secondEndPoint.dy);
    
    path.lineTo(size.width, size.height-40);
    path.lineTo(size.width, 0);

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}