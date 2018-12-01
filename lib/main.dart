import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import './store.dart';
import './appState.dart';
import './components/buttons/buttonContainer.dart';
import './components/clickTextCounters/clickTextCounter.dart';
import './components/swipeTextCounters/swipeUpTextCounterContainer.dart';
import './components/swipeTextCounters/swipeDownTextCounterContainer.dart';
import './components/swipeTextCounters/swipeLeftTextCounterContainer.dart';
import './components/swipeTextCounters/swipeRightTextCounterContainer.dart';
import './components/unlocks/unlocks.dart';
import './components/soundIcon/soundIcon.dart';

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
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SoundIcon(),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Center(
                        child: ClickTextCounter(),
                      ),
                    Center(
                        child: SwipeUpTextCounterContainer(),
                      ),
                    Center(
                        child: SwipeDownTextCounterContainer(),
                      ),
                    Center(
                        child: SwipeLeftTextCounterContainer(),
                      ),
                    Center(
                        child: SwipeRightTextCounterContainer(),
                      ),

                  ],
                ),
              ],
            ),
          ),
          Container(
            child: ButtonContainer(),
          ),
          Expanded(
            child: Container(
              child: UnlockContainer(),
            ),
          )
        ],
      ),
    );
  }
}
