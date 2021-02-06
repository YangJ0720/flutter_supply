import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supply/bloc/engine/bloc_engine.dart';
import 'package:supply/bloc/index_home_bloc.dart';
import 'package:supply/config/view_config.dart';
import 'package:supply/page/index/home/widget/index_home_nav_view.dart';
import 'package:supply/page/index/home/widget/index_home_tabbar_view.dart';
import 'package:supply/widget/banner_view.dart';

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
  // 悬浮选项卡
  final List<String> _tabHost = ['附近', '热销'];

  // 选项卡控制器
  TabController _tabController;

  /// 创建选项卡
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
    return BlocEngine<IndexHomeBloc>(
      builder: (_, bloc) {
        return StreamBuilder(
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              var model = snapshot.data;
              return DefaultTabController(
                child: NestedScrollView(
                  headerSliverBuilder: (_, innerBoxIsScrolled) {
                    return [
                      // 搜索组件
                      SliverPersistentHeader(
                        delegate: IndexHomeSliver(
                          IndexHomeSearchView(),
                          maxExtentSize: ViewConfig.APP_BAR_SIZE * 2,
                          paddingTop: paddingTop,
                        ),
                        pinned: true,
                      ),
                      // banner轮播组件
                      SliverToBoxAdapter(child: BannerView(model.data.banners)),
                      // 分类导航
                      SliverToBoxAdapter(child: IndexHomeNavView()),
                      // 悬浮选项卡
                      SliverPersistentHeader(
                        delegate: IndexHomeSliver(
                          tabBar,
                          maxExtentSize: extent,
                          minExtentSize: extent,
                        ),
                        pinned: true,
                      ),
                    ];
                  },
                  body: MediaQuery.removePadding(
                    context: context,
                    child: TabBarView(
                      children: List.generate(
                        _tabHost.length,
                        (index) => IndexHomeTabBarView(text: _tabHost[index]),
                      ),
                      controller: _tabController,
                    ),
                    removeTop: true,
                  ),
                ),
                length: 2,
              );
            }
            return Container(
              alignment: Alignment.center,
              child: Text('正在加载数据'),
            );
          },
          stream: bloc.stream,
        );
      },
      bloc: IndexHomeBloc(),
      initialize: (bloc) => bloc.loadData(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
