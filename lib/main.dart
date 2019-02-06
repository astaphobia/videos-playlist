import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:vplay/src/routes.dart';
import 'package:vplay/src/pages/splash_page.dart';
import 'package:vplay/src/pages/login_page.dart';
import 'package:vplay/src/res/values/strings.dart';
import 'package:vplay/src/res/values/styles.dart';
import 'package:vplay/src/pages/home_page.dart';
import 'package:vplay/src/store/models/models.dart';
import 'package:vplay/src/store/reducers/reducers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appStateReducer,
    initialState: AppState.initial(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: Strings.appTitle,
        theme: Styles.mainTheme,
        home: _middleware(),
        routes: routes,
      ),
    );
  }
}

Widget _middleware() {
  return new StreamBuilder<FirebaseUser>(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return SplashPage();
      } else {
        if (snapshot.hasData) {
          print(snapshot.data);
          return HomePage();
        }
        return LoginPage();
      }
    },
  );
}
