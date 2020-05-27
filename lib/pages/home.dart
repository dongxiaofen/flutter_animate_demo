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
    { 'title': 'Drag', 'router': '/drag' },
    { 'title': 'RunBoll1', 'router': '/runBoll1' },
    { 'title': 'ErrorCatch', 'router': '/errorCatch' },
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int idx) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, list[idx]['router']);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffE8EAEF),
                  width: 1,
                  style: BorderStyle.solid,
                )
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(list[idx]['title']),
                Icon(Icons.keyboard_arrow_right)
              ]
            ),
          ),
        )
      )
    );
  }
}