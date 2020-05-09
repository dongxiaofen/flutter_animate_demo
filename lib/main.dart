import 'package:flutter/material.dart';

import './pages/home.dart';
import './pages/circle.dart';
import './pages/physicsSimulation.dart';

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
        '/physicsSimulation': (BuildContext context) => PhysicsCardDragDemo(),
      },
    );
  }
}

