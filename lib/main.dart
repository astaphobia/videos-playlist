import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:vplay/src/routes.dart';
// import 'package:vplay/src/pages/home_page.dart';
import 'package:vplay/src/pages/splash_page.dart';
import 'package:vplay/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: HomePage(),
      home: _middleware(),
      routes: routes,
    );
  }
}

Widget _middleware() {
  return new StreamBuilder<FirebaseUser>(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return SplashPage();
      } else {
        if (snapshot.hasData) {
          return LoginPage();
        }
        return LoginPage();
      }
    },
  );
}
