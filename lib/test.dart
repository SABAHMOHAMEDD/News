import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  static const String RouteName = 'test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/pattern.png'),
                opacity: 1,
                fit: BoxFit.cover)),
      ),
    );
  }
}
