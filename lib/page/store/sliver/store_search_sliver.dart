import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supply/page/store/widget/store_info_view.dart';

/// 商铺搜索
class StoreSearchSliver extends SliverPersistentHeaderDelegate {
  final double _minExtent = 50;
  final double _maxExtent = 130;
  final double _paddingTop = MediaQueryData.fromWindow(window).padding.top;

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        // 背景
        Positioned(
          child: Container(
            child: Row(
              children: [
                Expanded(child: StoreInfoView('美宜佳（科兴科学园店SZ025）')),
                Container(
                  child: FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text('关注'),
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
            height: _maxExtent - _minExtent,
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          left: 0,
          right: 0,
          bottom: 0,
        ),
        // 搜索
        Positioned(
          child: Container(
            child: Row(
              children: [
                // 返回键
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                // 输入框
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          '搜索店铺商品',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0x90999999),
                    ),
                    padding: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                  ),
                ),
                // 分类
                IconButton(
                  icon: Icon(Icons.dehaze, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            color: Colors.blue,
            height: _minExtent + _paddingTop,
            padding: EdgeInsets.only(top: _paddingTop),
          ),
          left: 0,
          top: 0,
          right: 0,
        ),
      ],
    );
  }

  @override
  double get maxExtent => _maxExtent + _paddingTop;

  @override
  double get minExtent => _minExtent + _paddingTop;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
