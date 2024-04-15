// import 'package:app/home_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu primeiro app',
      home: HomePage(),
    );
  }
}
