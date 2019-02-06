import 'package:redux/redux.dart';

import 'package:vplay/src/store/models/models.dart';
import 'package:vplay/src/store/actions/actions.dart';

final Reducer<AuthUser> authUserReducer = combineReducers([
  TypedReducer<AuthUser, AuthUserLoadedAction>(_authUserLoaded),
]);

AuthUser _authUserLoaded(AuthUser authUser, AuthUserLoadedAction action) {
  return action.authUser;
}
