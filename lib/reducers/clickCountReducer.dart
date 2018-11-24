import "../actions/actions.dart";

int clickCountReducer(int state, dynamic action) {
  if (action is ClickAction) {
    return state + action.value;
  }
  return state;
}
