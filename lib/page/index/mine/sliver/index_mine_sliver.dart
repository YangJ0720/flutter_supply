import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supply/config/view_config.dart';
import 'package:supply/route/route_navigator.dart';
import 'package:supply/route/route_paths.dart';

///
class IndexMineSliver extends SliverPersistentHeaderDelegate {
  final double _extent = 135;
  final double _paddingTop = MediaQueryData.fromWindow(window).padding.top;

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Column(
        children: [
          // 设置
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () => pushNamed(context, RoutePaths.SETTINGS_PAGE),
            ),
          ),
          // 用户信息
          Expanded(
            child: Row(
              children: [
                // 头像
                Container(
                  child: Icon(Icons.person, color: Colors.white, size: 56),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300],
                  ),
                  margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  padding: EdgeInsets.all(2.5),
                ),
                // 用户昵称
                Text(
                  '登录/注册',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      color: Colors.blue,
      padding: EdgeInsets.only(top: _paddingTop),
    );
  }

  @override
  double get maxExtent => ViewConfig.APP_BAR_SIZE + _extent + _paddingTop;

  @override
  double get minExtent => ViewConfig.APP_BAR_SIZE + _paddingTop;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
