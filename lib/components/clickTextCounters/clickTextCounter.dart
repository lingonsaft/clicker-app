import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../appState.dart';
import '../../utils/challengeUtil.dart';
import '../../achivements/challenges.dart';

class ClickTextCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        Challenge challenge = getChallenge(vm.challengeKey);
        int amount = challenge.actions.clicks.amount;
        int remainingClicks = amount - vm.number;
        if (amount <= 0 || remainingClicks <= 0) {
          return Text('');
        }
        return Text(remainingClicks.toString());
      },
    );
  }
}

class _ViewModel {
  final int number;
  final String challengeKey;

  _ViewModel({@required this.number, @required this.challengeKey});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        number: store.state.clickCount, challengeKey: store.state.challengeKey);
  }
}
