import '../actions/actions.dart';

bool soundEffectReducer(bool state, dynamic action) {
  if (action is MuteSoundEffect) {
    return action.value;
  }
  return state;
}
