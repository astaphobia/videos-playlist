import 'package:flutter/material.dart';
import 'package:vplay/src/res/values/strings.dart';

class NavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Ketut Ariasa",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
            ),
            accountEmail: Text(
              "asthapobia@gmail.com",
              style: TextStyle(
                fontSize: 18.0, 
                fontWeight: FontWeight.w500,
                color: Colors.white
              )
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
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400
              ),
            ),
            onTap: () => Navigator.of(context).pushNamed(Strings.homeTag),
          )
        ],
      ),
    );

  }

}