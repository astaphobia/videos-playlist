import 'package:redux/redux.dart';

import 'package:vplay/src/store/reducers/reducers.dart';
import 'package:vplay/src/store/models/models.dart';
import 'package:vplay/src/store/middlewares/authUserMiddleware.dart';
import 'package:vplay/src/store/middlewares/videosMiddleware.dart';

final Store<AppState> store = Store<AppState>(
  appStateReducer,
  initialState: AppState.initial(),
  middleware: [
    authUserMiddleware,
    videosMiddleware,
  ].toList(),
);
