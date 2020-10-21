import 'package:flutter/material.dart';

import 'circle.dart';

class RouterChange extends StatefulWidget {
  const RouterChange();

  @override
  _RouterChangeState createState() => _RouterChangeState();
}

class _RouterChangeState extends State<RouterChange> {
  // @override /// WidgetsBindingObserver
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   switch (state) {
  //     case AppLifecycleState.inactive:
  //       print('AppLifecycleState.inactive');
  //       break;
  //     case AppLifecycleState.paused:
  //       print('AppLifecycleState.paused');
  //       break;
  //     case AppLifecycleState.resumed:
  //       print('AppLifecycleState.resumed');
  //       break;
  //     case AppLifecycleState.detached:
  //       print('AppLifecycleState.detached');
  //       break;
  //   }
  //   super.didChangeAppLifecycleState(state);
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由变更'),
      ),
      body: Column(
        children: [
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, '/circle');
            },
            child: Text('push router'),
          ),
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push<void>(context, MaterialPageRoute(
                settings: RouteSettings(name: '/push/circle'),
                builder: (_) => CancasCircle(title: 'circle')));
            },
            child: Text('push MaterialPageRoute'),
          ),
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                settings: RouteSettings(name: '/pushReplacement/circle'),
                builder: (_) => CancasCircle(title: 'circle')));
            },
            child: Text('replace 1'),
          ),
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                '/circle',
              );
            },
            child: Text('replace 2'),
          ),
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => CancasCircle(title: 'circle'),
                ),
              );
            },
            child: Text('replace 3'),
          ),
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('pop router'),
          )
        ]
      ),
    );
  }
}
