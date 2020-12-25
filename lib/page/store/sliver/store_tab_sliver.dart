import 'package:flutter/material.dart';

/// 商铺 -> 筛选组件
class StoreTabSliver extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final double _extent = 50;

  StoreTabSliver(this.tabBar);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: tabBar,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.25),
          bottom: BorderSide(color: Colors.grey, width: 0.25),
        ),
        color: Colors.white,
      ),
      height: _extent,
    );
  }

  @override
  double get maxExtent => _extent;

  @override
  double get minExtent => _extent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
