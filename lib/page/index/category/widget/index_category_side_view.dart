import 'dart:async';

import 'package:flutter/material.dart';

/// 分类 -> 一级分类
class IndexCategorySideView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexCategorySideViewState();
  }
}

class _IndexCategorySideViewState extends State<IndexCategorySideView> {
  int _index = 0;
  StreamController<List<_ItemModel>> _controller;

  ///
  Future<void> _loadData() async {
    var list = List<_ItemModel>();
    list.add(_ItemModel(0, '推荐'));
    list.add(_ItemModel(1, '食品酒饮'));
    list.add(_ItemModel(2, '母婴'));
    list.add(_ItemModel(3, '女装'));
    list.add(_ItemModel(4, '百货'));
    list.add(_ItemModel(5, '家电'));
    list.add(_ItemModel(6, '家居'));
    list.add(_ItemModel(7, '美妆'));
    list.add(_ItemModel(8, '洗护'));
    list.add(_ItemModel(9, '内衣'));
    list.add(_ItemModel(10, '女鞋'));
    list.add(_ItemModel(11, '数码'));
    list.add(_ItemModel(12, '成人'));
    list.add(_ItemModel(13, '萌宠'));
    list.add(_ItemModel(14, '个人清洁'));
    list.add(_ItemModel(15, '生鲜'));
    list.add(_ItemModel(16, '医药保健'));
    list.add(_ItemModel(17, '鲜花'));
    list.add(_ItemModel(18, '旅行'));
    list.add(_ItemModel(19, '其他'));
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
    return StreamBuilder<List<_ItemModel>>(
      builder: (_, snapshot) {
        var data = snapshot.data;
        return MediaQuery.removePadding(
          context: context,
          child: ListView.builder(
            itemBuilder: (_, index) {
              var item = data[index];
              return InkWell(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(item.name),
                  color: _index == index ? Colors.white : Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
                onTap: () {
                  _index = index;
                  _controller.sink.add(data);
                },
              );
            },
            itemCount: data.length,
            itemExtent: 60,
            physics: AlwaysScrollableScrollPhysics(),
          ),
          removeTop: true,
        );
      },
      stream: _controller.stream,
      initialData: [],
    );
  }
}

///
class _ItemModel {
  final int id;
  final String name;

  _ItemModel(this.id, this.name);
}
