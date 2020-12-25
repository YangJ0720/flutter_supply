import 'package:flutter/material.dart';
import 'package:supply/page/index/mine/sliver/index_mine_sliver.dart';

/// 我的
class IndexMine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexMineState();
  }
}

class _IndexMineState extends State<IndexMine>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(delegate: IndexMineSliver(), pinned: true),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
