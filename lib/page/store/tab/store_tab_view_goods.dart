import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supply/page/store/widget/store_shopping_car_view.dart';

/// 商铺 -> 选项卡 -> 商品
class StoreTabViewGoods extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreTabViewGoodsState();
  }
}

class _StoreTabViewGoodsState extends State<StoreTabViewGoods> {
  StreamController<int> _streamController;

  ///
  Widget _createListViewByLeft(int i) {
    return ListView.builder(
      itemBuilder: (_, index) {
        var color = i == index ? Colors.grey[300] : Colors.transparent;
        return GestureDetector(
          child: Container(
            alignment: Alignment.center,
            child: Text('index = $index', maxLines: 1),
            color: color,
          ),
          onTap: () => _streamController.sink.add(index),
        );
      },
      itemCount: 10,
      itemExtent: 50,
    );
  }

  ///
  Widget _createListViewByRight() {
    return ListView.builder(
      itemBuilder: (_, index) {
        return Card(child: Center(child: Text('index = $index')));
      },
      itemCount: 100,
      itemExtent: 150,
    );
  }

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
  }

  @override
  void dispose() {
    _streamController.close();
    _streamController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                child: StreamBuilder<int>(
                  builder: (_, snapshot) {
                    var index = snapshot.data ?? 0;
                    return _createListViewByLeft(index);
                  },
                  stream: _streamController.stream,
                ),
                color: Colors.transparent,
                width: 100,
              ),
              Expanded(child: _createListViewByRight()),
            ],
          ),
        ),
        // 购物车
        StoreShoppingCarView(),
      ],
    );
  }
}
