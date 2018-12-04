import 'package:meta/meta.dart';

@immutable
class AppState {
  final int clickCount;
  final String challengeKey;
  final Set<String> completeAchivements;
  final int swipeUpCount;
  final int swipeDownCount;
  final int swipeLeftCount;
  final int swipeRightCount;
  final bool soundEffectMuted;
  final bool musicMuted;

  AppState({
    this.clickCount,
    this.challengeKey,
    this.completeAchivements,
    this.swipeUpCount,
    this.swipeDownCount,
    this.swipeLeftCount,
    this.swipeRightCount,
    this.soundEffectMuted,
    this.musicMuted,
  });
}
