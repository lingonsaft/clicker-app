import '../appState.dart';
import './clickCountReducer.dart';
import './challengeReducer.dart';
import './completedAchivementsReducer.dart';
import './swipeCountReducer.dart';
import './soundEffectReducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    clickCount: clickCountReducer(state.clickCount, action),
    challengeKey: challengeReducer(state.challengeKey, action),
    completeAchivements:
        completedAchivementsReducer(state.completeAchivements, action),
    swipeUpCount: swipeUpReducer(state.swipeUpCount, action),
    swipeDownCount: swipeDownReducer(state.swipeDownCount, action),
    swipeLeftCount: swipeLeftReducer(state.swipeLeftCount, action),
    swipeRightCount: swipeRightReducer(state.swipeRightCount, action),
    soundEffectMuted: soundEffectReducer(state.soundEffectMuted, action),
  );
}
