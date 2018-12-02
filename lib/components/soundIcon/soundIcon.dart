import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../appState.dart';
import '../../utils/challengeUtil.dart';
import '../../actions/actions.dart';

class SoundIcon extends StatelessWidget {
  final Set<String> achivements = Set.from(['1.2', '1.1']);

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        String latestAchivement =
            getLatestAchivement(vm.completeAchivements, achivements);
        switch (latestAchivement) {
          case '1.1':
            return _StaticMutedSoundIcon();
          case '1.2':
            return _ClickableSoundIcon();
          default:
            return Column();
        }
      },
    );
  }
}

class _StaticMutedSoundIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.volume_off),
      iconSize: 40,
      padding: EdgeInsets.all(24),
      onPressed: () => null,
    );
  }
}

class _ClickableSoundIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return IconButton(
            icon: Icon(
              vm.soundEffectMuted ? Icons.volume_off : Icons.volume_up,
              color: Colors.black54,
            ),
            iconSize: 40,
            padding: EdgeInsets.all(24),
            onPressed: () {
              vm.muteSoundEffect(!vm.soundEffectMuted);
            },
          );
        });
  }
}

class _ViewModel {
  final Function(bool b) muteSoundEffect;
  final bool soundEffectMuted;
  final Set<String> completeAchivements;

  _ViewModel(
      this.muteSoundEffect, this.soundEffectMuted, this.completeAchivements);

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel((bool b) {
      store.dispatch(MuteSoundEffect(b));
    }, store.state.soundEffectMuted, store.state.completeAchivements);
  }
}
