import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../appState.dart';
import '../../utils/challengeUtil.dart';
import '../../achivements/challenges.dart';

class SwipeRightTextCounterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        Challenge challenge = getChallenge(vm.challengeKey);
        Map<String, bool> availableActions =
            getAvailableActions(vm.challengeKey);

        if (!availableActions['swipesRight']) {
          return Container();
        }

        int amount = challenge.actions.swipesRight.amount;
        int remainingClicks = amount - vm.swipeRightCount;

        if (amount <= 0 || remainingClicks <= 0) {
          return Container();
        }

        return Text(remainingClicks.toString() + ' right swipes');
      },
    );
  }
}

class _ViewModel {
  final int swipeRightCount;
  final String challengeKey;

  _ViewModel({@required this.swipeRightCount, @required this.challengeKey});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        swipeRightCount: store.state.swipeRightCount,
        challengeKey: store.state.challengeKey);
  }
}
