import 'package:redux/redux.dart';
import './appState.dart';
import 'reducers/appReducers.dart';

final AppStore = Store<AppState>(
  appReducer,
  initialState: AppState(
    clickCount: 0,
  ),
);
