import 'dart:ui';

import 'package:flutter/material.dart';

/// 商铺搜索
class StoreSearchSliver extends SliverPersistentHeaderDelegate {
  final double _extent = 50;
  final double _paddingTop = MediaQueryData.fromWindow(window).padding.top;

  @override
  Widget build(_, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Row(
        children: [],
      ),
      color: Colors.blue,
      height: _extent,
      margin: EdgeInsets.only(top: _paddingTop),
    );
  }

  @override
  double get maxExtent => _extent + _paddingTop;

  @override
  double get minExtent => _extent + _paddingTop;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
