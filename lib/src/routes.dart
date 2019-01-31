import 'package:flutter/material.dart';

import 'package:vplay/src/pages/home_page.dart';
import 'package:vplay/src/pages/login_page.dart';

final routes = <String, WidgetBuilder> {
  HomePage.tag: (BuildContext context) => HomePage(),
  LoginPage.tag: (BuildContext context) => LoginPage(),
};