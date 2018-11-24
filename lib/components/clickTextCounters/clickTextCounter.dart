import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../appState.dart';

class ClickTextCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) => Text(vm.number.toString()),
    );
  }
}

class _ViewModel {
  final int number;

  _ViewModel({@required this.number});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(number: store.state.clickCount);
  }
}
