import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clicker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: Center(child: Text('Text'))),
          Container(
              child: RaisedButton(
            child: Text('Button'),
            onPressed: () => print('click'),
          )),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
