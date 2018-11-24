import 'package:redux/redux.dart';
import './reducers/appReducer.dart';
import './appState.dart';

final AppStore = Store<AppState>(appReducer, initialState: AppState(0, "1"));
