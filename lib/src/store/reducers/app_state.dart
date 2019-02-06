import 'package:vplay/src/store/models/models.dart';
import 'package:vplay/src/store/reducers/reducers.dart';

AppState appStateReducer(AppState state, action) => AppState(
      isLoading: loadingreducer(state.isLoading, action),
      authUser: authUserReducer(state.authUser, action),
    );
