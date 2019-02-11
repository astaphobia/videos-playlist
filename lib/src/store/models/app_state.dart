import 'package:meta/meta.dart';
import 'package:vplay/src/store/models/models.dart';

@immutable
class AppState {
  final bool isLoading;
  final AuthUser authUser;
  final List<Video> videos;

  AppState({
    this.isLoading = false,
    this.authUser,
    this.videos,
  });

  factory AppState.initial() => AppState(
        isLoading: false,
        authUser: AuthUser(),
        videos: [],
      );
  factory AppState.loaded() => AppState(
        isLoading: true,
      );
}
