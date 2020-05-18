import 'package:flutter/material.dart';

class RunBall1 extends StatefulWidget {
  @override
  _RunBall1State createState() => _RunBall1State();
}

class _RunBall1State extends State<RunBall1> with SingleTickerProviderStateMixin {
  AnimationController controller;
  var _oldTime = DateTime.now().millisecondsSinceEpoch;//首次运行时时间
  // Ball _ball;
  // Rect _area;
  Rect _area = Rect.fromLTRB(0+40.0,0+200.0,280+40.0,200+200.0);
  Ball  _ball = Ball(color: Colors.blueAccent, r: 10,aY: 0.1, vX: 2, vY: -2,x: 40.0+140,y:200.0+100);

  @override
  void initState() {
    // setState(() {
    //   _area = Rect.fromLTRB(0+40.0,0+200.0,280+40.0,200+200.0);
    //   _ball = Ball(color: Colors.blueAccent, r: 10,aY: 0.1, vX: 2, vY: -2,x: 40.0+140,y:200.0+100);
    // });

    controller =//创建AnimationController对象
        AnimationController(duration: Duration(days: 999 * 365), vsync: this);
    controller.addListener(() {//添加监听,执行渲染
      _render();
    });
  }

  @override
  void dispose() {
    controller.dispose(); // 资源释放
  }

  //渲染方法，更新状态
  _render() {
    setState(() {
      updateBall();
      var now = DateTime.now().millisecondsSinceEpoch;//每一刷新时间
      print("时间差:${now - _oldTime}ms");//打印时间差
      _oldTime = now;//重新赋值
    });
  }
  void updateBall() {
    //运动学公式
    _ball.x += _ball.vX;
    _ball.y += _ball.vY;
    _ball.vX += _ball.aX;
    _ball.vY += _ball.aY;
    //限定下边界
    if (_ball.y > _area.bottom - _ball.r) {
      _ball.y = _area.bottom - _ball.r;
      _ball.vY = -_ball.vY;
      // _ball.color=randomRGB();//碰撞后随机色
    }
    //限定上边界
    if (_ball.y < _area.top + _ball.r) {
      _ball.y = _area.top + _ball.r;
      _ball.vY = -_ball.vY;
      // _ball.color=randomRGB();//碰撞后随机色
    }

    //限定左边界
    if (_ball.x < _area.left + _ball.r) {
      _ball.x = _area.left + _ball.r;
      _ball.vX = -_ball.vX;
      // _ball.color=randomRGB();//碰撞后随机色
    }

    //限定右边界
    if (_ball.x > _area.right - _ball.r) {
      _ball.x = _area.right - _ball.r;
      _ball.vX= -_ball.vX;
      // _ball.color=randomRGB();//碰撞后随机色
    }
  }

  @override
  Widget build(BuildContext context) {
    // var _area= Rect.fromLTRB(0+40.0,0+200.0,280+40.0,200+200.0);
    // var _ball = Ball(color: Colors.blueAccent, r: 10,x: 40.0+140,y:200.0+100);
    // var _ball = Ball(color: Colors.blueAccent, r: 10,aY: 0.1, vX: 2, vY: -2,x: 40.0+140,y:200.0+100);

    var child = Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.stop();
        },
        child: Text('暂停')
      ),
      body: CustomPaint(
        painter: RunBallView(_ball, _area),
      ),
    );

    return GestureDetector(//手势组件，做点击响应
      child: child,
      onTap: () {
        controller.forward();//执行动画
      },
    );
  }
}

// 球的信息
class Ball {
  double aX; // 加速度X
  double aY; // 加速度Y
  double vX; // 速度X
  double vY; // 速度Y
  double x; // 点位X
  double y; // 点位Y
  Color color;
  double r; // 小球半径
  Ball({
    this.aX = 0,
    this.aY = 0,
    this.vX = 0,
    this.vY = 0,
    this.x = 0,
    this.y = 0,
    this.color,
    this.r = 10,
  });
}

// 画板
class RunBallView extends CustomPainter {
  Ball _ball; // 小球
  Rect _area; // 运动区域
  Paint mPaint; // 主画笔
  Paint bgPaint; // 背景画笔
  RunBallView(this._ball, this._area) {
    mPaint = Paint();
    bgPaint = Paint()..color = Color.fromARGB(148, 198, 246, 248);
  }
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(_area, bgPaint);
    _drawBall(canvas, _ball);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  void _drawBall(Canvas canvas, Ball ball) {
    canvas.drawCircle(Offset(ball.x, ball.y), ball.r, mPaint..color = ball.color);
  }
}