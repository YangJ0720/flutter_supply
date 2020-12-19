import 'package:flutter/material.dart';
import 'package:supply/page/store/store.dart';

import 'page/index/index.dart';

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
      initialRoute: 'index',
      routes: {
        'index': (_) => Index(),
        'store': (_) => Store(),
      },
    );
  }
}
