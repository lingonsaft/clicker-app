class ClickAction {
  int value;
  ClickAction(this.value);
}

class AddAchivementAction {
  String key;
  AddAchivementAction(this.key);
}

enum ClickCount { ResetClickCount }

class SwipeUpAddAction {
  int value;
  SwipeUpAddAction(this.value);
}

class SwipeDownAddAction {
  int value;
  SwipeDownAddAction(this.value);
}

class SwipeLeftAddAction {
  int value;
  SwipeLeftAddAction(this.value);
}

class SwipeRightAddAction {
  int value;
  SwipeRightAddAction(this.value);
}

enum SwipeCount {
  ResetUpCount,
  ResetDownCount,
  ResetLeftCount,
  ResetRightCount
}

class SetChallengeKey {
  String key;
  SetChallengeKey(this.key);
}
