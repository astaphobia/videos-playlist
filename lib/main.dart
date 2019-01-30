import 'package:flutter/material.dart';

import 'package:vplay/src/routes.dart';
import 'package:vplay/src/pages/home_page.dart';
import 'package:vplay/src/res/values/strings.dart';
import 'package:vplay/src/res/values/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: Styles.mainTheme,
      home: HomePage(),
      routes: routes,
    );
  }
}