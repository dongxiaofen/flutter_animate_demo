import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final list = [
    { 'title': 'Canvas Circle', 'router': '/circle' },
    { 'title': 'Physics Simulation', 'router': '/physicsSimulation' },
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int idx) => RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, list[idx]['router']);
          },
          child: Text(list[idx]['title']),
        )
      )
    );
  }
}