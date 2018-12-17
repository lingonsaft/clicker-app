import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../appState.dart';

class PressTheButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        String _string = 'Press The Button!';
        int number = vm.clickCount;
        int numberOfSpaces =
            " ".allMatches(_string.substring(0, number + 1)).length;
        String displayString = _string.substring(0, number + numberOfSpaces);
        return Container(
          width: 240,
          child: Text(
            displayString,
            style: TextStyle(fontSize: 30),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final int clickCount;

  _ViewModel({@required this.clickCount});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      clickCount: store.state.clickCount,
    );
  }
}
