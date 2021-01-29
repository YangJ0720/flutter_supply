import 'package:flutter/material.dart';
import 'package:supply/route/route_paths.dart';
import 'package:supply/route/route_registered.dart';

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
      initialRoute: RoutePaths.INDEX_PAGE,
      routes: routes,
    );
  }
}
