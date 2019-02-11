import "package:vplay/src/store/models/models.dart";

class AuthUserCheckAction {}

class AuthUserOnLoadAction {}

class AuthUserLoadedAction {
  final AuthUser authUser;
  AuthUserLoadedAction(this.authUser);
}

class AuthUserFailedAction {}
