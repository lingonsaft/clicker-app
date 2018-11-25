class ClickAction {
  int value;
  ClickAction(this.value);
}

class AddAchivementAction {
  String key;
  AddAchivementAction(this.key);
}

enum ClickCount { ResetClickCount }

class SetChallengeKey {
  String key;
  SetChallengeKey(this.key);
}
