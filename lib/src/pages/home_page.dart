import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:vplay/src/components/navbar.dart';
import 'package:vplay/src/res/values/strings.dart';
import 'package:vplay/src/store/models/models.dart';

class HomePage extends StatelessWidget {
  static String tag = "/home_page";
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
        converter: (Store<AppState> store) => store,
        builder: (context, callback) => Scaffold(
              appBar: AppBar(
                title: Text(Strings.homeAppBarTitle),
              ),
              body: Container(
                child: Center(
                  child: Text(Strings.homeBodyTitle),
                ),
              ),
              drawer: NavBar(store: callback),
            ));
  }
}
