import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:vplay/src/res/values/strings.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    "Ketut Ariasa",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  accountEmail: Text(
                    "asthapobia@gmail.com",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  currentAccountPicture: FlutterLogo(),
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
                  onTap: () => Navigator.of(context).pushNamed("/home"),
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
                      await FirebaseAuth.instance.signOut().then((ok) {
                        Navigator.of(context)
                            .pushReplacementNamed("/login_page");
                      });
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
