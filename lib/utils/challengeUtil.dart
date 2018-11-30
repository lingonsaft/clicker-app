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
  Map<String, bool> availableActions = getAvailableActions(key);
  if (!availableActions['clicks']) {
    return '';
  }
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

Map<String,bool> getAvailableActions(String key) {
  Map<String, bool> actions = {
    'clicks': false,
    'swipesUp': false,
    'swipesDown': false,
    'swipesLeft': false,
    'swipesRight': false
  };
  Challenge _challenge = getChallenge(key);

  if (_challenge.actions.clicks != null) {
    actions['clicks'] = true;
  }

  if (_challenge.actions.swipesUp != null) {
    actions['swipesUp'] = true;
  }

  if (_challenge.actions.swipesDown != null) {
    actions['swipesDown'] = true;
  }

  if (_challenge.actions.swipesLeft != null) {
    actions['swipesLeft'] = true;
  }

  if (_challenge.actions.swipesRight != null) {
    actions['swipesRight'] = true;
  }

  return actions;
}

bool isSwipesUpComplete(String key, int amount) {
  Challenge _challenge = getChallenge(key);
  Map<String, bool> availableActions = getAvailableActions(key);
  if (!availableActions['swipesUp']) {
    return false;
  }

  if (_challenge.actions.clicks.amount == 0) {
    return true;
  }
  return _challenge.actions.clicks.amount == amount;
}

bool isSwipesDownComplete(String key, int amount) {
  Challenge _challenge = getChallenge(key);
  Map<String, bool> availableActions = getAvailableActions(key);
  if (!availableActions['swipesDown']) {
    return false;
  }

  if (_challenge.actions.clicks.amount == 0) {
    return true;
  }
  return _challenge.actions.clicks.amount == amount;
}

bool isSwipesLeftComplete(String key, int amount) {
  Challenge _challenge = getChallenge(key);
  Map<String, bool> availableActions = getAvailableActions(key);
  if (!availableActions['swipesLeft']) {
    return false;
  }

  if (_challenge.actions.clicks.amount == 0) {
    return true;
  }
  return _challenge.actions.clicks.amount == amount;
}

bool isSwipesRightComplete(String key, int amount) {
  Challenge _challenge = getChallenge(key);
  Map<String, bool> availableActions = getAvailableActions(key);
  if (!availableActions['swipesRight']) {
    return false;
  }

  if (_challenge.actions.clicks.amount == 0) {
    return true;
  }
  return _challenge.actions.clicks.amount == amount;
}

String getSwipeUpAchivement(String key, int amount) {
  Challenge _challenge = getChallenge(key);
  Map<String, bool> availableActions = getAvailableActions(key);
  if (!availableActions['swipesUp']) {
    return '';
  }
  String achivement = _challenge.actions.swipesUp.achivements[amount];
  return achivement == null ? '' : achivement;
}

String getSwipeDownAchivement(String key, int amount) {
  Challenge _challenge = getChallenge(key);
  Map<String, bool> availableActions = getAvailableActions(key);
  if (!availableActions['swipesDown']) {
    return '';
  }
  String achivement = _challenge.actions.swipesDown.achivements[amount];
  return achivement == null ? '' : achivement;
}

String getSwipeLeftAchivement(String key, int amount) {
  Challenge _challenge = getChallenge(key);
  Map<String, bool> availableActions = getAvailableActions(key);
  if (!availableActions['swipesLeft']) {
    return '';
  }
  String achivement = _challenge.actions.swipesLeft.achivements[amount];
  return achivement == null ? '' : achivement;
}

String getSwipeRightAchivement(String key, int amount) {
  Challenge _challenge = getChallenge(key);
  Map<String, bool> availableActions = getAvailableActions(key);
  if (!availableActions['swipesRight']) {
    return '';
  }
  String achivement = _challenge.actions.swipesRight.achivements[amount];
  return achivement == null ? '' : achivement;
}
