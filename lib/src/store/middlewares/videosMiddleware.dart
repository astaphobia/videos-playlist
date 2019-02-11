import 'package:dio/dio.dart';
import 'package:redux/redux.dart';
import 'package:vplay/src/res/values/strings.dart';

import 'package:vplay/src/store/actions/actions.dart';
import 'package:vplay/src/store/models/models.dart';
import 'package:vplay/src/utils/api.dart';

void videosMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  if (action is VideosOnInitActions) {
    if (store.state.videos.isEmpty) {
      Response response = await api.get("/search", queryParameters: {
        "key": Strings.youtubeApiKey,
        "part": "snippet",
      });
      if (response.statusCode == 200) {
        List<Video> videos = (response.data["items"] as List).map((item) {
          Video video = Video.fromJson(item);
          return video;
        }).toList();
        store.dispatch(VideosLoadedAction(videos));
      } else {
        store.dispatch(VideosFailedAction());
      }
    }
  }
  next(action);
}
