import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supply/config/base_config.dart';
import 'package:supply/page/store/widget/store_goods_number_view.dart';
import 'package:supply/page/store/widget/store_shopping_car_view.dart';
import 'package:supply/tools/image_load_tools.dart';

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
    List<String> list = ['酒水饮品', '休闲零食', '饼干蛋糕', '罐头', '调味品'];
    return ListView.builder(
      itemBuilder: (_, index) {
        var color = i == index ? Colors.grey[300] : Colors.transparent;
        return GestureDetector(
          child: Container(
            alignment: Alignment.center,
            child: Text(list[index], maxLines: 1),
            color: color,
          ),
          onTap: () => _streamController.sink.add(index),
        );
      },
      itemCount: list.length,
      itemExtent: 50,
    );
  }

  ///
  Widget _createListViewByRight() {
    return ListView.builder(
      itemBuilder: (_, index) {
        return Card(
          child: Row(
            children: [
              SizedBox(
                child: ImageLoadTools.load(
                  '${BaseConfig.host}home/image/milk.webp',
                ),
                width: 120,
                height: 120,
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
                    Text('月售180', style: TextStyle(fontSize: 10)),
                    // 商品数量控制器
                    // StoreGoodsNumberView(),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 100,
      itemExtent: 120,
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
