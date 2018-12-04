import '../actions/actions.dart';

bool musicReducer(bool state, dynamic action) {
  if (action is MuteMusic) {
    return action.value;
  }
  return state;
}
