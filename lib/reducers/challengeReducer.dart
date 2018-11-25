import "../actions/actions.dart";

String challengeReducer(String state, dynamic action) {
  if (action is SetChallengeKey) {
    return action.key;
  }
  return state;
}
