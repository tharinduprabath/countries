import 'package:flutter/material.dart';
import 'package:forum/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Countries',
      theme: ThemeData(
        primaryColor: Color(0xff344955),
        secondaryHeaderColor: Color(0xfff9aa33),
        primaryColorDark: Color(0xff232f34),
        primaryColorLight: Color(0xff4a6572),
        scaffoldBackgroundColor: Color(0xff344955),
        primaryTextTheme: TextTheme(),
        cardTheme: CardTheme(
          color: Color(0xff232f34),
        ),
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.grey,fontSize: 14),
          caption : TextStyle(color: Colors.grey, fontWeight: FontWeight
              .normal),
          subhead: TextStyle(color: Color(0xfff9aa33),fontSize: 24,
            fontWeight: FontWeight.bold,),
          )

        ),
      home: Home()
    );
  }
}
