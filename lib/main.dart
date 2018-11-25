import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './store.dart';
import './appState.dart';
import './components/buttons/button.dart';
import './components/clickTextCounters/clickTextCounter.dart';
import './components/unlocks/unlocks.dart';

void main() {
  runApp(MyApp(store: AppStore));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Clicker App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> ac = ["first", "second", "third"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: Center(child: ClickTextCounter())),
          Container(child: Button()),
          Expanded(
              child: Container(
            child: UnlockContainer(),
          ))
        ],
      ),
    );
  }
}
