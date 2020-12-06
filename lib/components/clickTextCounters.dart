import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../appState.dart';
//import '../pressTheButton/pressTheButton.dart';

class ClickTextCounter extends StatelessWidget {
  final Set<String> achivements = Set.from(['1']);

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {

        int remainingClicks = 1000 - vm.clickCount;

        if (1000 <= 0 || remainingClicks <= 0) {
          return Container();
        }
        return Text(remainingClicks.toString());
      },
    );
  }
}

class _ViewModel {
  final int clickCount;

  _ViewModel(
      {@required this.clickCount});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        clickCount: store.state.clickCount);
  }
}
