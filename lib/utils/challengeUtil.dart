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

String getClickAchivement(String key, int clickAmout) {
  Challenge _challenge = getChallenge(key);
  String achivement = _challenge.actions.clicks.achivements[clickAmout];
  return achivement == null ? '' : achivement;
}

String getNextChallengeKey(String key) {
  Challenge _challenge = getChallenge(key);
  return _challenge.nextChallenge;
}

String getLatestAchivement(
  Set<String> completeAchivements, Set<String> achivements) {

    Iterator iterator = achivements.iterator;
    while (iterator.moveNext()) {
      String current = iterator.current;
      if (completeAchivements.contains(current)) {
        return current;
      }
    }
    return '';
}
