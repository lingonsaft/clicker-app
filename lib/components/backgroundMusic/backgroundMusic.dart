import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../utils/challengeUtil.dart';
import '../../actions/actions.dart';
import '../../appState.dart';

class BackgroundMusic extends StatelessWidget {
  final Set<String> achivements = Set.from(['3.3', '3.2', '3.1']);

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        String latestAchivement =
            getLatestAchivement(vm.completeAchivements, achivements);
        switch (latestAchivement) {
          case '3.1':
            return _MutedMusicIcon();
          case '3.2':
            return _MutableBackgroundMusic();
          case '3.3':
            return _BackgroundMusic();
          default:
            return Card();
        }
      },
    );
  }
}

class _MutedMusicIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.volume_off,
        color: Colors.black54,
      ),
      iconSize: 40,
      padding: EdgeInsets.all(24),
      onPressed: () {},
    );
  }
}

class _MutableBackgroundMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return IconButton(
          icon: Icon(
            vm.musicMuted ? Icons.volume_off : Icons.volume_up,
            color: Colors.black54,
          ),
          iconSize: 40,
          padding: EdgeInsets.all(24),
          onPressed: () {},
        );
      },
    );
  }
}

class _BackgroundMusic extends StatelessWidget {
  static AudioCache aduioCachePlayer = new AudioCache();
  final String audioFile = 'gameMusic.wav';
  Future<AudioPlayer> _audioPlayer;

  Future<AudioPlayer> loopMusic() {
    return aduioCachePlayer.loop(audioFile);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        if (_audioPlayer == null) {
          _audioPlayer = vm.musicMuted ? null : loopMusic();
        }
        return IconButton(
          icon: Icon(
            vm.musicMuted ? Icons.volume_off : Icons.volume_up,
            color: Colors.black54,
          ),
          iconSize: 40,
          padding: EdgeInsets.all(24),
          onPressed: () {
            if (_audioPlayer != null) {
              if (vm.musicMuted) {
                _audioPlayer.then((ap) => ap.resume());
              } else {
                _audioPlayer.then((ap) => ap.pause());
              }
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
