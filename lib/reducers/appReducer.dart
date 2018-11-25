import '../appState.dart';
import './clickCountReducer.dart';
import './challengeReducer.dart';
import './completedAchivementsReducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
      clickCountReducer(state.clickCount, action),
      challengeReducer(state.challengeKey, action),
      completedAchivementsReducer(state.completeAchivements, action));
}
