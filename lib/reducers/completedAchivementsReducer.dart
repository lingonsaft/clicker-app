import "../actions/actions.dart";

List<String> completedAchivementsReducer(List<String> state, dynamic action) {
  if (action is AddAchivementAction) {
    state.add(action.key);
    return state;
  }
  return state;
}
