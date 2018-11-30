import 'package:redux/redux.dart';
import './reducers/appReducer.dart';
import './appState.dart';

final AppStore =
    Store<AppState>(appReducer, initialState: AppState(
      clickCount: 0,
      challengeKey: "1",
      completeAchivements: Set(),
      swipeUpCount: 0,
      swipeDownCount: 0,
      swipeLeftCount: 0,
      swipeRightCount: 0
    )
  );
