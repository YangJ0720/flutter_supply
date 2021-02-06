import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supply/config/base_config.dart';
import 'package:supply/config/view_config.dart';
import 'package:supply/tools/date_format_tools.dart';
import 'package:supply/tools/image_load_tools.dart';
import 'package:supply/widget/bar/base_app_bar.dart';
import 'package:supply/widget/bar/simple_app_bar.dart';

import 'widget/order_take_code_view.dart';

/// 订单
class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderPageState();
  }
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  final List<String> _tabs = ['全部', '待付款', '待收货', '待评价'];
  TabController _controller;

  ///
  List<Widget> _createTabBars() {
    var list = List<Widget>();
    _tabs.forEach((element) => list.add(Tab(text: element)));
    return list;
  }

  ///
  Widget _createItemView(int index) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    '美宜佳（科兴科学园店SZ025）',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.1),
                    ),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                ),
              ),
              Text(DateFormatTools.convertDateFormat(DateTime.now())),
              SizedBox(width: 10),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(width: 10),
                SizedBox(
                  child: ImageLoadTools.load(
                      '${BaseConfig.host}home/image/milk.webp'),
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '光明莫斯利安酸奶原味200g*12盒/24盒巴氏杀菌热处理风味酸牛奶',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '¥18.88',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                          Text('月售180', style: TextStyle(fontSize: 10)),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('x1', style: TextStyle(color: Colors.grey)),
                      ),
                      SizedBox(height: 5),
                      // 收件码
                      OrderTakeCodeView(),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                SizedBox(width: 10),
              ],
              mainAxisSize: MainAxisSize.max,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  ///
  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 5));
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
    return Scaffold(
      appBar: BaseAppBar(widget: SimpleAppBar(title: '我的订单')),
      body: Column(
        children: [
          TabBar(
            tabs: _createTabBars(),
            controller: _controller,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey[500],
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              child: TabBarView(
                children: List.generate(_tabs.length, (index) {
                  return RefreshIndicator(
                    child: ListView.builder(
                      itemBuilder: (_, index) => _createItemView(index),
                      itemCount: 100,
                      itemExtent: 180,
                    ),
                    onRefresh: () => _loadData(),
                  );
                }),
                controller: _controller,
              ),
              removeTop: true,
            ),
          ),
        ],
      ),
    );
  }
}
