import 'package:flutter/material.dart';

/// 跳转到路由表中对应的界面
Future<dynamic> pushNamed(BuildContext context, String routeName,
    {Object arguments}) async {
  return await Navigator.pushNamed(context, routeName, arguments: arguments);
}

/// 路由替换
Future<dynamic> pushReplacementNamed(BuildContext context, String routeName,
    {Object arguments}) async {
  return await Navigator.pushReplacementNamed(
    context,
    routeName,
    arguments: arguments,
  );
}

/// 返回某个界面，并将其栈顶的路由推出
Future<dynamic> pushNamedAndRemoveUntil(BuildContext context, String newRouteName,
    {Object arguments}) async {
  return await Navigator.pushNamedAndRemoveUntil(
    context,
    newRouteName,
    (route) => false,
    arguments: arguments,
  );
}
