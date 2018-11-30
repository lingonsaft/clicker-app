import '../actions/actions.dart';

int swipeUpReducer(int state, dynamic action) {
  if (action is SwipeUpAddAction) {
    return state + action.value;
  }
  if (action == SwipeCount.ResetUpCount) {
    return 0;
  }
  return state;
}

int swipeDownReducer(int state, dynamic action) {
  if (action is SwipeDownAddAction) {
    return state + action.value;
  }
  if (action == SwipeCount.ResetDownCount) {
    return 0;
  }
  return state;
}

int swipeLeftReducer(int state, dynamic action) {
  if (action is SwipeLeftAddAction) {
    return state + action.value;
  }
  if (action == SwipeCount.ResetLeftCount) {
    return 0;
  }
  return state;
}

int swipeRightReducer(int state, dynamic action) {
  if (action is SwipeRightAddAction) {
    return state + action.value;
  }
  if (action == SwipeCount.ResetRightCount) {
    return 0;
  }
  return state;
}
