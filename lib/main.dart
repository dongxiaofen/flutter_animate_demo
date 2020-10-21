import 'package:flutter/material.dart';
import 'package:flutter_canvas/store/video.dart';
import 'package:provider/provider.dart';
// import 'package:catcher/catcher_plugin.dart';

import './helpers/global_navigator_observer.dart';

import './pages/home.dart';
import './pages/circle.dart';
import './pages/physicsSimulation.dart';
import './pages/drag.dart';
import './pages/runBoll1.dart';
import './pages/clipPath.dart';
import './pages/router_change.dart';
// import './pages/video-float.dart';
// import 'package:flutter_canvas/pages/error-catch.dart';

void main() => runApp(
    MyApp()
);

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }
  @override /// WidgetsBindingObserver
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      // case AppLifecycleState.inactive:
      //   print('home应用程序处于非活动状态，并且未接收用户输入');
      //   print('AppLifecycleState.inactive');
      //   break;
      case AppLifecycleState.paused:
        // print('home用户当前看不到应用程序，没有响应');
        GlobalNavigatorbserver.onAppLifecyclePaused();
        break;
      case AppLifecycleState.resumed:
        // print('home应用程序可见并响应用户输入。');
        GlobalNavigatorbserver.onAppLifecycleResumed();
        break;
      // case AppLifecycleState.detached:
      //   print('AppLifecycleState.detached');
      //   break;
      default:
    }
    super.didChangeAppLifecycleState(state);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
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
        navigatorObservers: <NavigatorObserver>[GlobalNavigatorbserver((String eventType, String eventPage, int stayTime) {
          print('==================START');
          print('eventType $eventType');
          print('eventPage $eventPage');
          print('stayTime $stayTime');
          print('==================END');
        })],
        routes: {
          '/': (BuildContext context) => MyHomePage(title: 'List'),
          '/circle': (BuildContext context) => CancasCircle(title: 'circle'),
          '/drag': (BuildContext context) => DragDemo(),
          '/physicsSimulation': (BuildContext context) => PhysicsCardDragDemo(),
          '/runBoll1': (BuildContext context) => RunBall1(),
          '/clipPath': (BuildContext context) => ClipPathDemo(title: 'clipPathDemo',),
          '/routerChange': (BuildContext context) => RouterChange(),
          // '/videoFloat': (BuildContext context) => VideoFloat(),
          // '/errorCatch': (BuildContext context) => ErrorCatch(),
        },
      ),
    );
  }
}

