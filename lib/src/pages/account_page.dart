import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:vplay/src/components/navbar.dart';
import 'package:vplay/src/store/models/models.dart';

class AccountPage extends StatelessWidget {
  static String tag = "/account_page";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (Store<AppState> store) => store,
      builder: (context, callback) => Scaffold(
            appBar: AppBar(
              title: Text("Account Page"),
            ),
            body: Container(
              child: Center(
                child: Text(callback.state.authUser.email),
              ),
            ),
            drawer: NavBar(),
          ),
    );
  }
}
