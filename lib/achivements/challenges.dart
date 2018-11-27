class Challenge {
  final String selfKey;
  final String nextChallenge;
  final String achivement;
  final Actions actions;
  Challenge({this.selfKey, this.nextChallenge, this.achivement, this.actions});
}

class Actions {
  final Clicks clicks;
  Actions({this.clicks});
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
    actions:
        Actions(clicks: Clicks(amount: 10, achivements: {2: '1.1', 4: '1.2'})),
  ),
  "2": Challenge(
    selfKey: "2",
    nextChallenge: "3",
    achivement: "2",
    actions: Actions(clicks: Clicks(amount: 3, achivements: {2: '2.1'})),
  ),
  "3": Challenge(
    selfKey: "3",
    nextChallenge: "1",
    achivement: "3",
    actions: Actions(clicks: Clicks(amount: 5, achivements: {4: '3.1'})),
  ),
};
