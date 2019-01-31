import 'package:flutter/material.dart';
import 'package:vplay/src/components/navbar.dart';
import 'package:vplay/src/res/values/strings.dart';

class HomePage extends StatelessWidget {
  static String tag = Strings.homeTag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.homeAppBarTitle),
      ),
      body: Container(
        child: Center(
          child: Text(Strings.homeBodyTitle),
        ),
      ),
      drawer: NavBar(),
    );
  }
}