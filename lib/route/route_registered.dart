import 'package:flutter/material.dart';
import 'package:supply/page/about/about_page.dart';
import 'package:supply/page/index/index_page.dart';
import 'package:supply/page/location/location_page.dart';
import 'package:supply/page/location/location_edit_page.dart';
import 'package:supply/page/settings/settings_page.dart';
import 'package:supply/page/store/store_page.dart';

import 'route_paths.dart';

/// 路由表配置信息
final routes = {
  RoutePaths.INDEX_PAGE: (_, {arguments}) => IndexPage(), // 应用程序主界面
  RoutePaths.STORE_PAGE: (_, {arguments}) => StorePage(),
  RoutePaths.LOCATION_PAGE: (_, {arguments}) => LocationPage(),
  RoutePaths.LOCATION_EDIT_PAGE: (_, {arguments}) => LocationEditPage(),
  RoutePaths.SETTINGS_PAGE: (_, {arguments}) => SettingsPage(), // 设置界面
  RoutePaths.ABOUT_PAGE: (_, {arguments}) => AboutPage(), // 关于我们
};

/// 根据路由名称生产对应的路由
Route<dynamic> Function(RouteSettings settings) onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageBuilder = routes[name];
  // 判断跳转界面是否在路由表中注册
  if (pageBuilder == null) {
    // 弹出路由跳转错误界面提示
    return null;
  }
  // 跳转到路由表对应的界面
  final Route route = MaterialPageRoute(
    builder: (context) => pageBuilder(context, arguments: settings.arguments),
  );
  return route;
};
