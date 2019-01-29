import 'package:flutter/material.dart';
import 'package:vplay/src/res/values/strings.dart';

class NavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(Strings.drawerTitle),
            ),
          ),
          ListTile(
            title: Text(Strings.drawerHomeTitle),
            onTap: () => Navigator.of(context).pushNamed(Strings.homeTag),
          )
        ],
      ),
    );
  }

}