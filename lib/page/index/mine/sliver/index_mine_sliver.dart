import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supply/config/view_config.dart';

///
class IndexMineSliver extends SliverPersistentHeaderDelegate {
  final double _extent = 135;
  final double _paddingTop = MediaQueryData.fromWindow(window).padding.top;

  ///
  Widget _createIconButton(IconData iconData, String text) {
    return Column(
      children: [Icon(iconData), Text(text)],
      mainAxisSize: MainAxisSize.min,
    );
  }

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              child: Column(
                children: [
                  // 用户信息
                  Row(
                    children: [
                      // 头像
                      Container(
                        child: Icon(Icons.person, size: 36),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
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
                  // 商品收藏、店铺关注、喜欢内容、浏览记录
                  Expanded(
                    child: Row(
                      children: [
                        _createIconButton(Icons.history, '商品收藏'),
                        _createIconButton(Icons.history, '店铺关注'),
                        _createIconButton(Icons.history, '喜欢内容'),
                        _createIconButton(Icons.history, '浏览历史'),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blue[300], Colors.blue[200]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              height: _extent,
              padding: EdgeInsets.only(top: _paddingTop),
            ),
            left: 0,
            top: ViewConfig.APP_BAR_SIZE,
            right: 0,
            bottom: 0,
          ),
          Positioned(
            child: Container(
              child: Stack(
                children: [
                  Align(
                    child: Text('我的', style: TextStyle(color: Colors.white)),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.settings, color: Colors.white),
                      onPressed: () => Navigator.pushNamed(context, 'settings'),
                    ),
                  ),
                ],
              ),
              color: Colors.transparent,
              height: ViewConfig.APP_BAR_SIZE,
            ),
            left: 0,
            top: _paddingTop,
            right: 0,
          ),
        ],
      ),
      height: maxExtent,
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
