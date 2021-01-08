import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supply/config/view_config.dart';

///
class StoreOrderBarSliver extends SliverPersistentHeaderDelegate {
  final double paddingTop = MediaQueryData.fromWindow(window).padding.top;

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Row(
        children: [
          // 返回按钮
          SizedBox(
            child: FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
              shape: CircleBorder(),
            ),
            width: 50,
            height: 50,
          ),
          //
          Text(
            '提交订单',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          //
          SizedBox(width: 50, height: 50),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      color: Colors.blue,
      height: maxExtent,
      padding: EdgeInsets.only(top: paddingTop),
    );
  }

  @override
  double get maxExtent => ViewConfig.APP_BAR_SIZE + paddingTop;

  @override
  double get minExtent => ViewConfig.APP_BAR_SIZE + paddingTop;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
