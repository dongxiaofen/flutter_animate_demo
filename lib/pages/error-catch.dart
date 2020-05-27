import 'package:flutter/material.dart';
import 'package:catcher/catcher_plugin.dart';

class ErrorCatch extends StatelessWidget {
  generateError() async {
    // throw "Test exception";
    // final List list = [1, 2];
    // print(list);
    // print(list[3]);
    Catcher.sendTestException();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('physics simulation'),
      ),
      body: Container(
            child: FlatButton(
                child: Text("Generate error"),
                onPressed: () => generateError())),
    );
  }
}
