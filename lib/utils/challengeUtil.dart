import '../achivements/challenges.dart';

Challenge getChallenge(String key) {
  return challenges[key];
}

bool isClicksComplete(String key, int clickAmount) {
  Challenge _challenge = getChallenge(key);
  if (_challenge.actions.clicks.amount == 0) {
    return true;
  }
  return _challenge.actions.clicks.amount == clickAmount;
}

String getClickAchivement(String key) {
  Challenge _challenge = getChallenge(key);
  return _challenge.actions.clicks.achivement;
}
