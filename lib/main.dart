import 'package:flutter/material.dart';
import 'package:kurs3_sabak6/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kurs3 Sabak6',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0A0E21),
      ),
      home: HomePage(),
    );
  }
}
