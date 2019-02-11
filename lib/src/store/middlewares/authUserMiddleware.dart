import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';

import 'package:vplay/src/store/actions/actions.dart';
import 'package:vplay/src/store/models/models.dart';
import 'package:vplay/src/utils/authentication.dart';

void authUserMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  if (action is AuthUserCheckAction) {
    if (store.state.authUser.email.isEmpty) {
      store.dispatch(AuthUserOnLoadAction());
      FirebaseUser user = await isLoggedIn();
      if (user != null) {
        AuthUser authUser = AuthUser(
          email: user.email,
          provideId: user.providerId,
          photoUrl: user.photoUrl,
          displayName: user.displayName,
          uid: user.uid,
          phoneNumber: user.phoneNumber,
        );
        store.dispatch(AuthUserLoadedAction(authUser));
      } else {
        store.dispatch(AuthUserFailedAction());
      }
    }
  }
  next(action);
}
