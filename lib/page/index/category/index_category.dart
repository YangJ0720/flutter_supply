import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supply/config/view_config.dart';
import 'package:supply/page/index/category/widget/index_category_grid_view.dart';
import 'package:supply/page/index/category/widget/index_category_side_view.dart';

/// 分类
class IndexCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexCategoryState();
  }
}

class _IndexCategoryState extends State<IndexCategory> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var paddingTop = MediaQueryData.fromWindow(window).padding.top;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            '分类',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: Colors.blue,
          height: ViewConfig.APP_BAR_SIZE + paddingTop,
          padding: EdgeInsets.only(top: paddingTop),
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                child: IndexCategorySideView(),
                color: Colors.grey[200],
                width: 120,
              ),
              Expanded(child: IndexCategoryGridView()),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
