import 'package:flutter/material.dart';
import 'package:supply/config/view_config.dart';

/// 首页搜索
class IndexHomeSliver extends SliverPersistentHeaderDelegate {
  final Widget widget;
  final double extent;
  final double paddingTop;

  IndexHomeSliver(
    this.widget, {
    this.extent = ViewConfig.APP_BAR_SIZE,
    this.paddingTop = 0,
  });

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: widget,
      color: Colors.white,
      height: maxExtent,
      padding: EdgeInsets.only(top: paddingTop),
    );
  }

  @override
  double get maxExtent => extent + paddingTop;

  @override
  double get minExtent => extent + paddingTop;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
