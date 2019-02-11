import 'package:vplay/src/store/models/models.dart';

class VideosOnInitActions {}

class VideosOnLoadAction {}

class VideosLoadedAction {
  final List<Video> videos;
  VideosLoadedAction(
    this.videos,
  );
}

class VideosFailedAction {}
