import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vplay/src/res/values/strings.dart';
import 'package:vplay/src/store/models/models.dart';
import 'package:vplay/src/components/shaped_image.dart';

class NavBar extends StatelessWidget {
  final Store<AppState> store;
  NavBar({@required this.store}) : assert(store != null);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    store.state.authUser.displayName != null
                        ? store.state.authUser.displayName
                        : "Unnamed",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  accountEmail: Text(
                    store.state.authUser.email != null
                        ? store.state.authUser.email
                        : "xxx@vplay.com",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  currentAccountPicture: store.state.authUser.photoUrl != null
                      ? ShapedImage(imgPath: store.state.authUser.photoUrl)
                      : ShapedImage(imgPath: store.state.authUser.email),
                  decoration: BoxDecoration(
                    color: Colors.teal[800],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text(
                    Strings.drawerHomeTitle,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                  ),
                  onTap: () => Navigator.of(context).pushNamed("/home_page"),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(
                    "Account Detail",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                  ),
                  onTap: () => Navigator.of(context).pushNamed("/account_page"),
                ),
                ListTile(
                  leading: Icon(Icons.video_library),
                  title: Text(
                    "Videos",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () => Navigator.of(context).pushNamed("/videos_page"),
                ),
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                children: <Widget>[
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Signout",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () async {
                      try {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context)
                            .pushReplacementNamed("/login_page");
                      } catch (e) {}
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
