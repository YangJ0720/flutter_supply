import 'package:flutter/material.dart';
import 'package:supply/config/view_config.dart';
import 'package:supply/page/index/mine/sliver/index_mine_sliver.dart';

/// 消息
class IndexMessage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexIndexMessage();
  }
}

class _IndexIndexMessage extends State<IndexMessage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(title: Text('消息'), centerTitle: true, pinned: true),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (_, index) {
              return Card(child: Center(child: Text('index = $index')));
            },
            childCount: 100,
          ),
          itemExtent: 80,
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
