import 'package:redux/redux.dart';

import 'package:vplay/src/store/actions/actions.dart';

final loadingreducer = combineReducers<bool>([
  /**
   * On Load @isLoading true
   */
  TypedReducer<bool, AuthUserOnLoadAction>(_loading),
  TypedReducer<bool, VideosOnLoadAction>(_loading),
  /**
  * Loaded @isloading false
   */
  TypedReducer<bool, AuthUserLoadedAction>(_loaded),
  TypedReducer<bool, AuthUserFailedAction>(_loaded),
  TypedReducer<bool, VideosLoadedAction>(_loaded),
  TypedReducer<bool, VideosFailedAction>(_loaded),
]);

bool _loading(bool state, action) {
  return true;
}

bool _loaded(bool state, action) {
  return false;
}
