import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
      ),
      routes: {
        HomeScreen.RouteName: (_) => HomeScreen(),
        Test.RouteName: (_) => Test(),
      },
      initialRoute: HomeScreen.RouteName,
    );
  }
}

