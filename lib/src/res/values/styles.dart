import 'package:flutter/material.dart';


class Styles {
  static ThemeData mainTheme = ThemeData(
    //primarySwatch: Colors.green,
    
    brightness: Brightness.light,
    primaryColor: Colors.teal[800],
    accentColor: Colors.deepOrangeAccent[600],
    
    fontFamily: 'Montserrat',
    
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}