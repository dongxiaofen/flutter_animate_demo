import 'package:flutter/material.dart';

class DragDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('physics simulation'),
      ),
      body: DraggableCard(
          child: FlutterLogo(
        size: 128,
      )),
    );
  }
}

class DraggableCard extends StatefulWidget {
  final Widget child;
  DraggableCard({this.child});

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Alignment _dragAlignment = Alignment.center;
  Animation<Alignment> _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
        ..addListener(() {
          print('_animation.value ${_animation.value}');
          setState(() {
            _dragAlignment = _animation.value;
          });
        });
  }
  void _runAnimation() {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    _controller.reset();
    _controller.forward();
  }
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print('size.width ${size.width}');
    return GestureDetector(
      onPanDown: (data) {
        _controller.stop();
      },
      onPanUpdate: (data) {
        print('data.delta.dx / (size.width / 2) ${data.delta.dx / (size.width / 2)}');
        print('data.delta.dx ${data.delta.dx}');
        setState(() {
          _dragAlignment += Alignment(
            data.delta.dx / (size.width / 2),
            data.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (data) {
        _runAnimation();
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}
