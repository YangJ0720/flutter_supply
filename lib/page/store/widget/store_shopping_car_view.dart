import 'package:flutter/material.dart';
import 'package:flutter_alipay/flutter_alipay.dart';
import 'package:fluwx/fluwx.dart';
import 'package:supply/route/route_navigator.dart';
import 'package:supply/route/route_paths.dart';

/// 商铺 -> 购物车
class StoreShoppingCarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreShoppingCarViewState();
  }
}

class _StoreShoppingCarViewState extends State<StoreShoppingCarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // 购物车图标
          Icon(Icons.shopping_cart),
          // 金额
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '¥18.88',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // 结算
          FlatButton(
            onPressed: () => pushNamed(context, RoutePaths.STORE_ORDER_PAGE),
            child: Container(
              child: Text('提交订单', style: TextStyle(color: Colors.white)),
            ),
            splashColor: Colors.green,
            color: Colors.green[300],
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.25)),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5),
    );
  }
}
