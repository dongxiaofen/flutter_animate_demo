import 'package:flutter/material.dart';
// import 'package:flutter_canvas/pages/RunBoll1.dart';

import './pages/home.dart';
import './pages/circle.dart';
import './pages/physicsSimulation.dart';
import './pages/drag.dart';
import './pages/runBoll1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Canvas Circle'),
      routes: {
        '/': (BuildContext context) => MyHomePage(title: 'List'),
        '/circle': (BuildContext context) => CancasCircle(title: 'circle'),
        '/drag': (BuildContext context) => DragDemo(),
        '/physicsSimulation': (BuildContext context) => PhysicsCardDragDemo(),
        '/runBoll1': (BuildContext context) => RunBall1(),
      },
    );
  }
}

