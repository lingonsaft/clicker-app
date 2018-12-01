import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../appState.dart';
import '../../utils/challengeUtil.dart';
import '../../achivements/challenges.dart';

class SwipeUpTextCounterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        Challenge challenge = getChallenge(vm.challengeKey);
        Map<String, bool> availableActions =
            getAvailableActions(vm.challengeKey);

        if (!availableActions['swipesUp']) {
          return Container();
        }

        int amount = challenge.actions.swipesUp.amount;
        int remainingClicks = amount - vm.swipeUpCount;

        if (amount <= 0 || remainingClicks <= 0) {
          return Container();
        }

        return Text(remainingClicks.toString() + ' up swipes');
      },
    );
  }
}

class _ViewModel {
  final int swipeUpCount;
  final String challengeKey;

  _ViewModel({@required this.swipeUpCount, @required this.challengeKey});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        swipeUpCount: store.state.swipeUpCount,
        challengeKey: store.state.challengeKey);
  }
}
