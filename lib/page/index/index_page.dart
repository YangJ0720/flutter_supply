import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bmflocation/bdmap_location_flutter_plugin.dart';
import 'package:supply/page/index/category/index_category.dart';
import 'package:supply/tools/location_tools.dart';

import 'home/index_home.dart';
import 'mine/index_mine.dart';
import 'shopping/index_shopping.dart';

/// 应用程序主界面
class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {
  // 选项卡
  final List<Widget> _list = [
    IndexHome(),
    IndexCategory(),
    IndexShopping(),
    IndexMine(),
  ];

  PageController _controller;
  StreamController<int> _streamController;

  // 创建导航栏
  BottomNavigationBarItem _createNavBarItem(IconData iconData, String label) {
    return BottomNavigationBarItem(icon: Icon(iconData), label: label);
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _streamController = StreamController();
    // 初始化百度定位SDK
    LocationTools().initialize();
    // 设置iOS端百度定位AK
    if (Platform.isIOS) {
      LocationFlutterPlugin.setApiKey('key');
    }
    // 申请定位权限
    LocationFlutterPlugin().requestPermission();
    // 开始定位
    // LocationTools().start();
  }

  @override
  void dispose() {
    // 结束定位
    // LocationTools().stop();
    _streamController.close();
    _streamController = null;
    _controller.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemBuilder: (_, index) => _list[index],
        itemCount: _list.length,
        onPageChanged: (index) => _streamController.sink.add(index),
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: StreamBuilder<int>(
        builder: (_, snapshot) {
          var currentIndex = snapshot.data ?? 0;
          return BottomNavigationBar(
            items: [
              _createNavBarItem(Icons.home, '首页'),
              _createNavBarItem(Icons.category, '分类'),
              _createNavBarItem(Icons.shopping_cart, '购物车'),
              _createNavBarItem(Icons.person, '我的'),
            ],
            currentIndex: currentIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (index) => _controller.jumpToPage(index),
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
          );
        },
        stream: _streamController.stream,
      ),
    );
  }
}
