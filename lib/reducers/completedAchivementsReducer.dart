import "../actions/actions.dart";

Set<String> completedAchivementsReducer(Set<String> state, dynamic action) {
  if (action is AddAchivementAction) {
    if (action.key == '') {
      return state;
    }

    state.add(action.key);
    return state;
  }
  return state;
}
