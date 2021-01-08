import 'dart:async';

import 'package:flutter/material.dart';

/// 购物车 -> 提交订单 -> 支付
class StoreOrderPayView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreOrderPayViewState();
  }
}

class _StoreOrderPayViewState extends State<StoreOrderPayView> {
  final List<_PayModel> _list = [
    _PayModel(1, '微信支付', 'images/ic_pay_wx.webp'),
    _PayModel(2, '支付宝支付', 'images/ic_pay_ali.webp'),
  ];

  int _groupValue = 0;
  StreamController<List<_PayModel>> _controller;

  ///
  Widget _createItemView(List<_PayModel> data, int index) {
    var item = data[index];
    return Row(
      children: [
        Image.asset(item.image),
        SizedBox(width: 10),
        Expanded(child: Text(item.name)),
        Radio(
          value: item.id,
          groupValue: _groupValue,
          onChanged: (value) {
            _groupValue = value;
            _controller.sink.add(data);
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = StreamController();
  }

  @override
  void dispose() {
    _controller.close();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<_PayModel>>(
        builder: (_, snapshot) {
          var data = snapshot.data;
          return ListView.separated(
            itemBuilder: (_, index) => _createItemView(data, index),
            separatorBuilder: (_, index) {
              return Divider(color: Colors.grey, height: 0.5);
            },
            itemCount: _list.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          );
        },
        initialData: _list,
        stream: _controller.stream,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.1),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
    );
  }
}

///
class _PayModel {
  final int id;
  final String name;
  final String image;

  _PayModel(this.id, this.name, this.image);
}
