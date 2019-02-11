import 'package:redux/redux.dart';

import 'package:vplay/src/store/models/models.dart';
import 'package:vplay/src/store/actions/actions.dart';

final Reducer<List<Video>> videosReducer = combineReducers([
  TypedReducer<List<Video>, VideosLoadedAction>(_videosLoaded),
]);

List<Video> _videosLoaded(List<Video> videos, VideosLoadedAction action) {
  return action.videos;
}
