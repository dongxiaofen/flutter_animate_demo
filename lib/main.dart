import 'package:flutter/material.dart';
import 'package:catcher/catcher_plugin.dart';
// import 'package:flutter_canvas/pages/RunBoll1.dart';

import './pages/home.dart';
import './pages/circle.dart';
import './pages/physicsSimulation.dart';
import './pages/drag.dart';
import './pages/runBoll1.dart';
import 'package:flutter_canvas/pages/error-catch.dart';

// void main() => runApp(MyApp());
main(List<String> args) {
  CatcherOptions debugOptions =
    CatcherOptions(SilentReportMode(), [
      ConsoleHandler(),
      HttpHandler(HttpRequestType.post, Uri.parse("https://www-pre.naoxuejia.com/api/errorReport"),
          printLogs: true),
    ]);
  CatcherOptions releaseOptions = CatcherOptions(SilentReportMode(), [
    ConsoleHandler(),
    HttpHandler(HttpRequestType.post, Uri.parse("https://www-pre.naoxuejia.com/api/errorReport")),
  ]);
  
  Catcher(MyApp(), debugConfig: debugOptions, releaseConfig: releaseOptions);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Catcher.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (BuildContext context) => MyHomePage(title: 'List'),
        '/circle': (BuildContext context) => CancasCircle(title: 'circle'),
        '/drag': (BuildContext context) => DragDemo(),
        '/physicsSimulation': (BuildContext context) => PhysicsCardDragDemo(),
        '/runBoll1': (BuildContext context) => RunBall1(),
        '/errorCatch': (BuildContext context) => ErrorCatch(),
      },
    );
  }
}

