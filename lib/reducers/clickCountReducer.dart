import "../actions/actions.dart";

int clickCountReducer(int state, dynamic action) {
  if (action is ClickAction) {
    return state + action.value;
  }
  if (action == ClickCount.ResetClickCount) {
    return 0;
  }
  return state;
}
