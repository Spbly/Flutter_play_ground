import '../appState.dart';
import './clickCountReducer.dart';


AppState appReducer(AppState state, dynamic action) {
  return AppState(
    clickCount: clickCountReducer(state.clickCount, action),
  );
}
