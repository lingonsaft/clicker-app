import "../actions/actions.dart";

String challengeReducer(String state, dynamic action) {
  if (action is ChallengeAction) {
    return action.key;
  }
  return state;
}
