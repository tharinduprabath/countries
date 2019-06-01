import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget{
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Card(child: Text("Hello Wolrd"),elevation:15),
      ),
    );
  }
}