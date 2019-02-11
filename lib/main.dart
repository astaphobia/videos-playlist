import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vplay/src/pages/home_page.dart';
import 'package:vplay/src/pages/login_page.dart';

import 'package:vplay/src/routes.dart';
import 'package:vplay/src/res/values/strings.dart';
import 'package:vplay/src/res/values/styles.dart';
import 'package:vplay/src/store/actions/actions.dart';
import 'package:vplay/src/store/models/models.dart';
import 'package:vplay/src/store/store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: Strings.appTitle,
        theme: Styles.mainTheme,
        home: StoreConnector<AppState, Store<AppState>>(
          onInit: (store) {
            store.dispatch(AuthUserCheckAction());
          },
          converter: (Store<AppState> store) => store,
          builder: (context, store) => _widget(store),
        ),
        routes: routes,
      ),
    );
  }
}

Widget _widget(Store<AppState> store) {
  if (store.state.authUser.email.isEmpty) {
    return LoginPage();
  }
  return HomePage();
}
