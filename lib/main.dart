import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supply/bloc/home_list_bloc.dart';
import 'package:supply/page/location/location_edit.dart';
import 'package:supply/page/order/order.dart';
import 'package:supply/page/settings/settings.dart';
import 'package:supply/page/store/store.dart';
import 'package:supply/page/store/store_order.dart';

import 'page/index/index.dart';
import 'page/location/location.dart';

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
      home: BlocProvider(create: (_) => HomeListBloc(0), child: Index()),
      routes: {
        'index': (_) => Index(),
        'store': (_) => Store(),
        'location': (_) => Location(),
        'location_edit': (_) => LocationEdit(),
        'order': (_) => Order(),
        'settings': (_) => Settings(),
        'store_order': (_) => StoreOrder(),
      },
    );
  }
}
