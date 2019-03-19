import 'package:flutter/material.dart';
import 'views/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLUTTER BURGER',
      theme: ThemeData(
        indicatorColor: Colors.white,
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber,
        accentColor: Colors.black,
      ),
      home: new Home(),
    );
  }
}