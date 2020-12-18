import 'package:flutter/material.dart';
import 'package:supply/page/index/home/widget/index_home_search_view.dart';

///
class IndexHomeSliver extends SliverPersistentHeaderDelegate {
  final double _extent = 50;

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: IndexHomeSearchView(),
      color: Colors.white,
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
