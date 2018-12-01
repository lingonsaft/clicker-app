import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../appState.dart';
import '../../utils/challengeUtil.dart';
import '../../achivements/challenges.dart';

class SwipeDownTextCounterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        Challenge challenge = getChallenge(vm.challengeKey);
        Map<String, bool> availableActions =
            getAvailableActions(vm.challengeKey);

        if (!availableActions['swipesDown']) {
          return Container();
        }

        int amount = challenge.actions.swipesDown.amount;
        int remainingClicks = amount - vm.swipeDownCount;

        if (amount <= 0 || remainingClicks <= 0) {
          return Container();
        }

        return Text(remainingClicks.toString() + ' down swipes');
      },
    );
  }
}

class _ViewModel {
  final int swipeDownCount;
  final String challengeKey;

  _ViewModel({@required this.swipeDownCount, @required this.challengeKey});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        swipeDownCount: store.state.swipeDownCount,
        challengeKey: store.state.challengeKey);
  }
}
