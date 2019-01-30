import 'package:flutter/material.dart';

import 'package:vplay/src/components/navbar.dart';

class HomePage extends StatelessWidget {
  static String tag = "home_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Center(
          child: Text("This is home page"),
        ),
      ),
      drawer: NavBar(),
    );
  }
}