import 'package:flutter/material.dart';
import 'package:kurs3_sabak6/app_constants/app_colors.dart';

import 'package:kurs3_sabak6/screens/home_screen.dart';

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
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
      home: HomeScreen(),
    );
  }
}
