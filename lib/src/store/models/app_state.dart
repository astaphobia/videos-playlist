import 'package:meta/meta.dart';
import 'package:vplay/src/store/models/models.dart';

@immutable
class AppState {
  final bool isLoading;
  final AuthUser authUser;
  
  AppState({this.isLoading = false, this.authUser});
  
  factory AppState.initial() => AppState(
	  isLoading: false, 
	  authUser: AuthUser(),
  );
}
