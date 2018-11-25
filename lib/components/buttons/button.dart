import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../actions/actions.dart';
import '../../appState.dart';
import '../../utils/challengeUtil.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, _ViewModel vm) => RaisedButton(
              child: Text('Button'),
              onPressed: () {
                vm.addClick(1);
                if (isClicksComplete(vm.challengeKey, vm.clickCount + 1)) {
                  String achivement = getClickAchivement(vm.challengeKey);
                  vm.addAchivements(achivement);
                  vm.resetClickCount();
                  vm.setChallengeKey(getNextChallengeKey(vm.challengeKey));
                }
              },
            ));
  }
}

class _ViewModel {
  final Function(int n) addClick;
  final Function(String key) addAchivements;
  final Function() resetClickCount;
  final Function(String key) setChallengeKey;
  final String challengeKey;
  final int clickCount;

  _ViewModel(this.addClick, this.addAchivements, this.resetClickCount,
      this.setChallengeKey, this.challengeKey, this.clickCount);

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel((int n) {
      store.dispatch(ClickAction(n));
    }, (String key) {
      store.dispatch(AddAchivementAction(key));
    }, () {
      store.dispatch(ClickCount.ResetClickCount);
    }, (String key) {
      store.dispatch(SetChallengeKey(key));
    }, store.state.challengeKey, store.state.clickCount);
  }
}
