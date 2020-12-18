import 'dart:async';

import 'package:flutter/material.dart';
import 'file:///F:/GithubProjects/supply/lib/page/index/home/index_home.dart';
import 'file:///F:/GithubProjects/supply/lib/page/index/mine/index_mine.dart';
import 'file:///F:/GithubProjects/supply/lib/page/index/order/index_order.dart';

///
class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<Index> {
  // 选项卡
  final List<Widget> _list = [
    IndexHome(),
    IndexOrder(),
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
  }

  @override
  void dispose() {
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
      ),
      bottomNavigationBar: StreamBuilder<int>(
        builder: (_, snapshot) {
          var currentIndex = snapshot.data ?? 0;
          return BottomNavigationBar(
            items: [
              _createNavBarItem(Icons.home, '首页'),
              _createNavBarItem(Icons.reorder, '订单'),
              _createNavBarItem(Icons.person, '我的'),
            ],
            currentIndex: currentIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (index) => _controller.jumpToPage(index),
          );
        },
        stream: _streamController.stream,
      ),
    );
  }
}