import 'package:flutter/material.dart';
import 'package:supply/page/store/sliver/store_search_sliver.dart';
import 'package:supply/page/store/sliver/store_tab_sliver.dart';
import 'package:supply/page/store/tab/store_tab_view_about.dart';
import 'package:supply/page/store/tab/store_tab_view_evaluation.dart';

import 'tab/store_tab_view_goods.dart';

/// 商铺界面
class Store extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreState();
  }
}

class _StoreState extends State<Store> with TickerProviderStateMixin {
  final List<String> _list = ['商品', '评价', '商家'];
  TabController _controller;

  ///
  TabBar _createTabBar() {
    return TabBar(
      controller: _controller,
      tabs: List.generate(_list.length, (index) => Tab(text: _list[index])),
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  ///
  Widget _createTabBarView() {
    return MediaQuery.removePadding(
      context: context,
      child: TabBarView(
        children: [
          StoreTabViewGoods(),
          StoreTabViewEvaluation(),
          StoreTabViewAbout(),
        ],
        controller: _controller,
      ),
      removeTop: true,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _list.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: _list.length,
        child: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                delegate: StoreSearchSliver(),
                pinned: true,
              ),
              SliverPersistentHeader(
                delegate: StoreTabSliver(_createTabBar()),
                pinned: true,
              ),
            ];
          },
          body: _createTabBarView(),
        ),
      ),
    );
  }
}
