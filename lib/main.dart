import 'package:flutter/material.dart';
import 'file:///F:/GithubProjects/supply/lib/page/index/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(padding: EdgeInsets.zero),
      ),
      home: Index(),
    );
  }
}