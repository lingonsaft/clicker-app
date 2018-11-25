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

String getNextChallengeKey(String key) {
  Challenge _challenge = getChallenge(key);
  return _challenge.nextChallenge;
}

String getLatestAchivement(
    List<String> completeAchivements, List<String> achivements) {
  for (int achivementsIndex = achivements.length - 1;
      achivementsIndex >= 0;
      achivementsIndex--) {
    String _achivement = achivements[achivementsIndex];
    if (completeAchivements.contains(_achivement)) {
      return _achivement;
    }
  }
  return '';
}
