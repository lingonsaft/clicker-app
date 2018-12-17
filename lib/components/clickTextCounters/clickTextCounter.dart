import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../appState.dart';
import '../../utils/challengeUtil.dart';
import '../../achivements/challenges.dart';
import '../pressTheButton/pressTheButton.dart';

class ClickTextCounter extends StatelessWidget {
  final Set<String> achivements = Set.from(['1']);

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        Challenge challenge = getChallenge(vm.challengeKey);

        Map<String, bool> availableActions =
            getAvailableActions(vm.challengeKey);

        String latestAchivement =
            getLatestAchivement(vm.completeAchivements, achivements);

        // Todo make clickTextCount into unlockable achivement!
        if (latestAchivement != '1') {
          return PressTheButton();
        }

        if (!availableActions['clicks']) {
          return Container();
        }

        int amount = challenge.actions.clicks.amount;
        int remainingClicks = amount - vm.clickCount;

        if (amount <= 0 || remainingClicks <= 0) {
          return Container();
        }
        return Text(remainingClicks.toString());
      },
    );
  }
}

class _ViewModel {
  final int clickCount;
  final String challengeKey;
  final Set<String> completeAchivements;

  _ViewModel(
      {@required this.clickCount,
      @required this.challengeKey,
      @required this.completeAchivements});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        clickCount: store.state.clickCount,
        challengeKey: store.state.challengeKey,
        completeAchivements: store.state.completeAchivements);
  }
}
