import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsCardDragDemo extends StatelessWidget {
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
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    // _controller.reset();
    // _controller.forward();

    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
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
        // _runAnimation();
        _runAnimation(data.velocity.pixelsPerSecond, size);
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
