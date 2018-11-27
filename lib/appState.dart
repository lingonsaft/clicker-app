import 'package:meta/meta.dart';

@immutable
class AppState {
  final int clickCount;
  final String challengeKey;
  final Set<String> completeAchivements;
  AppState(this.clickCount, this.challengeKey, this.completeAchivements);
}
