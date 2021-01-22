import 'package:flutter/material.dart';

import 'index_home_address_view.dart';

/// 搜索框
class IndexHomeSearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: IndexHomeAddressView()),
            IconButton(icon: Icon(Icons.sms_rounded), onPressed: () {}),
          ],
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text('搜索商品名称/商铺名称'),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey[200],
            ),
            margin: EdgeInsets.fromLTRB(7.5, 10, 7.5, 10),
          ),
        ),
      ],
    );
  }
}
