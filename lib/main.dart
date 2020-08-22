import 'package:flutter/material.dart';
import 'package:flutter_canvas/store/video.dart';
import 'package:provider/provider.dart';
// import 'package:catcher/catcher_plugin.dart';

import './pages/home.dart';
import './pages/circle.dart';
import './pages/physicsSimulation.dart';
import './pages/drag.dart';
import './pages/runBoll1.dart';
import './pages/clipPath.dart';
import './pages/video-float.dart';
// import 'package:flutter_canvas/pages/error-catch.dart';

void main() => runApp(
    MyApp()
);
// main() {
//   // STEP 1. Create catcher configuration.
//   CatcherOptions debugOptions =
//     CatcherOptions(SilentReportMode(), [
//       ConsoleHandler(),
//       HttpHandler(HttpRequestType.post, Uri.parse("https://www-pre.naoxuejia.com/api/errorReport"),
//           printLogs: true),
//     ]);
//   CatcherOptions releaseOptions = CatcherOptions(SilentReportMode(), [
//     ConsoleHandler(),
//     HttpHandler(HttpRequestType.post, Uri.parse("https://www-pre.naoxuejia.com/api/errorReport")),
//   ]);
//   // STEP 2. Pass your root widget (MyApp) along with Catcher configuration:
//   Catcher(MyApp(), debugConfig: debugOptions, releaseConfig: releaseOptions);
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<VideoStore>(
          create: (_) => VideoStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        // STEP 3. Add navigator key from Catcher. It will be used to navigate user to report page or to show dialog.
        // navigatorKey: Catcher.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (BuildContext context) => MyHomePage(title: 'List'),
          '/circle': (BuildContext context) => CancasCircle(title: 'circle'),
          '/drag': (BuildContext context) => DragDemo(),
          '/physicsSimulation': (BuildContext context) => PhysicsCardDragDemo(),
          '/runBoll1': (BuildContext context) => RunBall1(),
          '/clipPath': (BuildContext context) => ClipPathDemo(title: 'clipPathDemo',),
          '/videoFloat': (BuildContext context) => VideoFloat(),
          // '/errorCatch': (BuildContext context) => ErrorCatch(),
        },
      ),
    );
  }
}

