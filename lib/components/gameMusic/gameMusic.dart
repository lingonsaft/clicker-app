import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../actions/actions.dart';
import '../../appState.dart';

// todo change name to backgroundMusic
// Add in achivement

class GameMusic extends StatelessWidget {
  static AudioCache player = new AudioCache();
  final String audioFile = 'gameMusic.wav';

  Future<AudioPlayer> loopMusic() {
    return player.loop(audioFile);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        Future<AudioPlayer> _audioPlayer = vm.musicMuted ? null : loopMusic();
        return IconButton(
          icon: Icon(
            vm.musicMuted ? Icons.volume_off : Icons.volume_up,
            color: Colors.black54,
          ),
          iconSize: 40,
          padding: EdgeInsets.all(24),
          onPressed: () {
            if (_audioPlayer != null) {
              _audioPlayer.then((ap) => ap.stop());
            }
            vm.muteMusic(!vm.musicMuted);
          },
        );
      },
    );
  }
}

class _ViewModel {
  final Function(bool b) muteMusic;
  final bool musicMuted;
  final Set<String> completeAchivements;

  _ViewModel(this.muteMusic, this.musicMuted, this.completeAchivements);

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel((bool b) {
      store.dispatch(MuteMusic(b));
    }, store.state.musicMuted, store.state.completeAchivements);
  }
}
