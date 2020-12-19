import 'package:flutter/material.dart';

/// 首页搜索
class IndexHomeSliver extends SliverPersistentHeaderDelegate {
  final Widget widget;
  final double extent;

  IndexHomeSliver(this.widget, {this.extent = 50});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: widget,
      color: Colors.white,
      height: extent,
    );
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => extent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
