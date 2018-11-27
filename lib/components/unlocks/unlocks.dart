import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../appState.dart';
import '../../utils/challengeUtil.dart';

class UnlockContainer extends StatelessWidget {
  final Set<String> achivements = Set.from(['3.1', '2.1', '1.2', '1.1']);

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        String latestAchivement =
            getLatestAchivement(vm.completeAchivements, achivements);
        switch (latestAchivement) {
          case '1.1':
            return UnlockOne();
          case '1.2':
            return Text('1.2');
          case '2.1':
            return UnlockTwo();
          case '3.1':
            return UnlockThree();
          default:
            return Container();
        }
      },
    );
  }
}

class _ViewModel {
  final Set<String> completeAchivements;

  _ViewModel({@required this.completeAchivements});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(completeAchivements: store.state.completeAchivements);
  }
}

class UnlockOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('1.1');
  }
}

class UnlockTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('2.1');
  }
}

class UnlockThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('3.1');
  }
}
