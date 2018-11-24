import 'package:meta/meta.dart';

@immutable
class AppState {
  final int clickCount;
  final String challengeKey;
  AppState(this.clickCount, this.challengeKey);
}
