import 'package:flutter/material.dart';
import 'package:flutter_application_3/pantalla/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SetPointsHomePage(),
    );
  }
}
