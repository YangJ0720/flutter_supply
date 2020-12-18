import 'package:flutter/material.dart';
import 'package:supply/config/base_config.dart';
import 'package:supply/guide/guide_order.dart';
import 'package:supply/page/store/store.dart';
import 'package:supply/widget/banner_view.dart';

import 'sliver/index_home_sliver.dart';

/// 首页
class IndexHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexHomeState();
  }
}

class _IndexHomeState extends State<IndexHome>
    with AutomaticKeepAliveClientMixin {
  final String _url = '${BaseConfig.host}raw/master/flutter_takeout/';
  List<String> _banner;

  @override
  void initState() {
    super.initState();
    _banner = List<String>();
    _banner.add('${_url}images/banner/9JBHlnd_VeeOmCACOva2qIFFhrU!MA.jpg');
    _banner.add('${_url}images/banner/AYV09JvHTIjtTxpRwk8jLy59V8s!MA.jpg');
    _banner.add('${_url}images/banner/5mJ7NzI1J18yMWRocHGJ4pxpJzw!MA.jpg');
    _banner.add('${_url}images/banner/vYrYdiA0zzgGTVwUtc_L_H-9_Tg!MA.jpg');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // 搜索组件
          SliverPersistentHeader(delegate: IndexHomeSliver(), pinned: true),
          // banner轮播组件
          SliverToBoxAdapter(child: BannerView(_banner)),
          //
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                return Card(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('index = $index'),
                  ),
                );
              },
              childCount: 100,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
