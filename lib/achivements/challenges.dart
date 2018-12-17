class Challenge {
  final String selfKey;
  final String nextChallenge;
  final String achivement;
  final Actions actions;
  Challenge({this.selfKey, this.nextChallenge, this.achivement, this.actions});
}

class Actions {
  final Clicks clicks;
  final Swipes swipesUp;
  final Swipes swipesDown;
  final Swipes swipesLeft;
  final Swipes swipesRight;
  Actions(
      {this.clicks,
      this.swipesUp,
      this.swipesDown,
      this.swipesLeft,
      this.swipesRight});
}

class Swipes {
  final int amount;
  final Map<int, String> achivements;
  Swipes({this.amount = 0, this.achivements = const {}});
}

class Clicks {
  final int amount;
  final Map<int, String> achivements;
  Clicks({this.amount = 0, this.achivements = const {}});
}

final challenges = {
  "1": Challenge(
    selfKey: "1",
    nextChallenge: "2",
    achivement: "1",
    actions: Actions(
      clicks: Clicks(amount: 16),
    ),
  ),
  "2": Challenge(
    selfKey: "2",
    nextChallenge: "3",
    achivement: "2",
    actions: Actions(
      clicks: Clicks(amount: 10),
      swipesLeft: Swipes(amount: 5, achivements: {}),
    ),
  ),
  "3": Challenge(
    selfKey: "3",
    nextChallenge: "4",
    achivement: "3",
    actions: Actions(
      clicks: Clicks(amount: 10, achivements: {2: '3.1', 4: '3.2', 6: '3.3'}),
      swipesDown: Swipes(amount: 2, achivements: {}),
    ),
  ),
  "4": Challenge(
    selfKey: "4",
    nextChallenge: "1",
    achivement: "4",
    actions: Actions(
      clicks: Clicks(amount: 10, achivements: {2: '4.1', 4: '4.2', 6: '4.3'}),
      swipesDown: Swipes(amount: 2, achivements: {}),
    ),
  ),
};
