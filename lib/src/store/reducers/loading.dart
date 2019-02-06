import 'package:redux/redux.dart';

import 'package:vplay/src/store/actions/actions.dart';

final loadingreducer = combineReducers<bool>([
  TypedReducer<bool, AuthUserLoadedAction>(_loading),
]);

bool _loading(bool state, action) {
  return false;
}
