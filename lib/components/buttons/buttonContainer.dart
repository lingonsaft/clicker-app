import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../actions/actions.dart';
import '../../appState.dart';
import '../../utils/challengeUtil.dart';
import './standardButton.dart';
import '../../lib/showNotification.dart';
import '../../utils/achivementsUtil.dart';
import '../../achivements/achivements.dart';

ShowNotification notification = ShowNotification();

class ButtonContainer extends StatefulWidget {

  @override
  _ButtonContainer createState() => _ButtonContainer();
}

class _ButtonContainer extends State<ButtonContainer> {
  final Set<String> achivements = Set.from(['1.1']);
  bool clicksCompleted = false;

  /*
   * runs on each interaction with the button
   * should reset store and change challange if all
   * conditions are true
  */
  void onChallangeCompletion (_ViewModel vm) {
    if (this.clicksCompleted) {
      vm.resetClickCount();
      vm.setChallengeKey(getNextChallengeKey(vm.challengeKey));

      clicksCompleted = false;
    }
  }

  void onAchivement(_ViewModel vm String achivement) {
    if (achivement != '') {
      Achivement _achivement = getAchivement(achivement);
      notification.display(
        title: _achivement.title,
        body: _achivement.body,
        context: context
      );
      vm.addAchivements(achivement);
    }
  }

  void onPressed(_ViewModel vm) {
    vm.addClick(1);

    String achivement = getClickAchivement(vm.challengeKey, vm.clickCount + 1);
    onAchivement(vm, achivement);

    if (isClicksComplete(vm.challengeKey, vm.clickCount + 1)) {
      this.clicksCompleted = true;
    }

    onChallangeCompletion(vm);
  }

  Widget getButtonWidget(_ViewModel vm) {
    String latestAchivement =
        getLatestAchivement(vm.completeAchivements, achivements);
    switch (latestAchivement) {
      case '1.1':
        return StandardButton(
          text: 'Hey <3',
          textStyle: TextStyle(fontSize: 20, color: Colors.red),
          onPressed: () => this.onPressed(vm));
      default:
        return StandardButton(
            text: 'Button', onPressed: () => this.onPressed(vm));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, _ViewModel vm) => getButtonWidget(vm));
  }
}

class _ViewModel {
  final Function(int n) addClick;
  final Function(String key) addAchivements;
  final Function() resetClickCount;
  final Function(String key) setChallengeKey;
  final String challengeKey;
  final int clickCount;
  final Set<String> completeAchivements;

  _ViewModel(
      this.addClick,
      this.addAchivements,
      this.resetClickCount,
      this.setChallengeKey,
      this.challengeKey,
      this.clickCount,
      this.completeAchivements);

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel((int n) {
      store.dispatch(ClickAction(n));
    }, (String key) {
      store.dispatch(AddAchivementAction(key));
    }, () {
      store.dispatch(ClickCount.ResetClickCount);
    }, (String key) {
      store.dispatch(SetChallengeKey(key));
    }, store.state.challengeKey, store.state.clickCount,
        store.state.completeAchivements);
  }
}