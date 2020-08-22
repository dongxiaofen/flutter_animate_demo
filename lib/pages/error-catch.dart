import 'package:flutter/material.dart';
import 'package:catcher/catcher_plugin.dart';

class ErrorCatch extends StatelessWidget {
  final bool isShow;
  ErrorCatch({this.isShow});
  generateError() async {
    // throw "Test exception";
    // final List list = [1, 2];
    // print(list);
    // print(list[3]);
    // Catcher.sendTestException();
    throw "Test exception";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('physics simulation'),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
              child: Text("Generate error"), onPressed: () => generateError()),
          // if (isShow) 
          // Container(child: Text('test'),)
        ],
      ),
    );
  }
}
