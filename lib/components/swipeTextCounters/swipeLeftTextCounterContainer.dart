import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../appState.dart';
import '../../utils/challengeUtil.dart';
import '../../achivements/challenges.dart';

class SwipeLeftTextCounterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        Challenge challenge = getChallenge(vm.challengeKey);
        Map<String, bool> availableActions =
            getAvailableActions(vm.challengeKey);

        if (!availableActions['swipesLeft']) {
          return Container();
        }

        int amount = challenge.actions.swipesLeft.amount;
        int remainingClicks = amount - vm.swipeLeftCount;

        if (amount <= 0 || remainingClicks <= 0) {
          return Container();
        }

        return Text(remainingClicks.toString() + ' left swipes');
      },
    );
  }
}

class _ViewModel {
  final int swipeLeftCount;
  final String challengeKey;

  _ViewModel({@required this.swipeLeftCount, @required this.challengeKey});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        swipeLeftCount: store.state.swipeLeftCount,
        challengeKey: store.state.challengeKey);
  }
}
