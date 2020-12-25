import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supply/config/base_config.dart';
import 'package:supply/guide/guide_order.dart';
import 'package:supply/page/index/home/widget/index_home_nav_view.dart';
import 'package:supply/page/index/home/widget/index_home_tabbar_view.dart';
import 'package:supply/page/store/store.dart';
import 'package:supply/widget/banner_view.dart';

import 'sliver/index_home_sliver.dart';
import 'sliver/index_home_sliver.dart';
import 'widget/index_home_search_view.dart';

/// 首页
class IndexHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexHomeState();
  }
}

class _IndexHomeState extends State<IndexHome>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final String _url = '${BaseConfig.host}raw/master/flutter_takeout/';

  // banner轮播组件
  List<String> _banner;

  // 悬浮选项卡
  final List<String> _tabHost = ['附近', '热销'];

  // 选项卡控制器
  TabController _tabController;

  // 创建选项卡
  Widget _createTabBars() {
    var tabs = List<Widget>.generate(_tabHost.length, (index) {
      return Tab(text: _tabHost[index]);
    });
    return TabBar(
      tabs: tabs,
      controller: _tabController,
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      isScrollable: true,
    );
  }

  @override
  void initState() {
    super.initState();
    _banner = List<String>();
    _banner.add('${_url}images/banner/9JBHlnd_VeeOmCACOva2qIFFhrU!MA.jpg');
    _banner.add('${_url}images/banner/AYV09JvHTIjtTxpRwk8jLy59V8s!MA.jpg');
    _banner.add('${_url}images/banner/5mJ7NzI1J18yMWRocHGJ4pxpJzw!MA.jpg');
    _banner.add('${_url}images/banner/vYrYdiA0zzgGTVwUtc_L_H-9_Tg!MA.jpg');
    // 初始化选项卡控制器
    _tabController = TabController(length: _tabHost.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double paddingTop = MediaQueryData.fromWindow(window).padding.top;
    TabBar tabBar = _createTabBars();
    var extent = tabBar.preferredSize.height;
    return DefaultTabController(
      child: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            // 搜索组件
            SliverPersistentHeader(
              delegate: IndexHomeSliver(
                IndexHomeSearchView(),
                paddingTop: paddingTop,
              ),
              pinned: true,
            ),
            // banner轮播组件
            SliverToBoxAdapter(child: BannerView(_banner)),
            // 分类导航
            SliverToBoxAdapter(child: IndexHomeNavView()),
            // 悬浮选项卡
            SliverPersistentHeader(
              delegate: IndexHomeSliver(tabBar, extent: extent),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          children: List.generate(
            _tabHost.length,
            (index) => IndexHomeTabBarView(text: _tabHost[index]),
          ),
          controller: _tabController,
        ),
      ),
      length: 2,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
