import 'package:flutter/material.dart';

/// 订单
class IndexOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexOrderState();
  }
}

class _IndexOrderState extends State<IndexOrder> with TickerProviderStateMixin {
  final List<String> _tabs = ['全部', '待付款', '待配送', '待收货', '待评价'];
  TabController _controller;

  List<Widget> _createTabBars() {
    var list = List<Widget>();
    _tabs.forEach((element) => list.add(Tab(text: element)));
    return list;
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TabBar(
            tabs: _createTabBars(),
            controller: _controller,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey[500],
          ),
          Expanded(
            child: TabBarView(
              children: List.generate(_tabs.length, (index) {
                return ListView.builder(
                  itemBuilder: (_, i) => ListTile(title: Text('i = $i')),
                  itemCount: 100,
                );
              }),
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
