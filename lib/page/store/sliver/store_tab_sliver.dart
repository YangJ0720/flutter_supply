import 'package:flutter/material.dart';

/// 商铺 -> 筛选组件
class StoreTabSliver extends SliverPersistentHeaderDelegate {
  final double _extent = 50;

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Row(
        children: [
          FlatButton(onPressed: () {}, child: Text('综合')),
          FlatButton(onPressed: () {}, child: Text('销量')),
          FlatButton(onPressed: () {}, child: Text('价格')),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                color: Colors.grey,
                width: 0.5,
                height: _extent * 0.5,
              ),
            ),
          ),
          IconButton(icon: Icon(Icons.list), onPressed: () {}),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.25),
          bottom: BorderSide(color: Colors.grey, width: 0.25),
        ),
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
