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
  final String achivement;
  Clicks({this.amount = 0, this.achivement = ""});
}

final challenges = {
  "1": Challenge(
    selfKey: "1",
    nextChallenge: "2",
    achivement: "1",
    actions: Actions(clicks: Clicks(amount: 10, achivement: "1.1")),
  ),
  "2": Challenge(
    selfKey: "2",
    nextChallenge: "3",
    achivement: "2",
    actions: Actions(clicks: Clicks(amount: 3, achivement: "2.1")),
  ),
  "3": Challenge(
    selfKey: "3",
    nextChallenge: "2",
    achivement: "3",
    actions: Actions(clicks: Clicks(amount: 5, achivement: "3.1")),
  ),
};
