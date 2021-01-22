import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supply/config/view_config.dart';
import 'package:supply/page/store/widget/store_shopping_car_view.dart';
import 'package:supply/widget/goods_list_item_view.dart';

/// 购物车
class IndexShopping extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexShoppingState();
  }
}

class _IndexShoppingState extends State<IndexShopping>
    with AutomaticKeepAliveClientMixin {
  StreamController<List<String>> _controller;

  ///
  Future<void> _loadData() async {
    var list = List.generate(10, (index) => index.toString());
    _controller.sink.add(list);
  }

  @override
  void initState() {
    super.initState();
    _controller = StreamController();
    _loadData();
  }

  @override
  void dispose() {
    _controller.close();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var paddingTop = MediaQueryData.fromWindow(window).padding.top;
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              SizedBox(width: ViewConfig.APP_BAR_SIZE),
              Text(
                '购物车',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  child: Text('编辑', style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                width: ViewConfig.APP_BAR_SIZE,
                height: ViewConfig.APP_BAR_SIZE,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          color: Colors.blue,
          height: ViewConfig.APP_BAR_SIZE + paddingTop,
          padding: EdgeInsets.only(top: paddingTop),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: MediaQuery.removePadding(
                  context: context,
                  child: StreamBuilder<List<String>>(
                    builder: (_, snapshot) {
                      var data = snapshot.data;
                      return ListView.separated(
                        itemBuilder: (_, index) => GoodsListItemView(
                          image:
                              'https://gitee.com/YangJ0720/flutter_city_supply/raw/master/home/image/list/anmuxi.jpg',
                          name: '酸牛奶',
                          callback: () {
                            data.removeAt(index);
                            _controller.sink.add(data);
                          },
                        ),
                        separatorBuilder: (_, index) {
                          return Divider(color: Colors.grey, height: 0.1);
                        },
                        itemCount: data.length,
                      );
                    },
                    stream: _controller.stream,
                    initialData: [],
                  ),
                  removeTop: true,
                ),
              ),
              Positioned(
                child: StoreShoppingCarView(),
                left: 0,
                right: 0,
                bottom: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
