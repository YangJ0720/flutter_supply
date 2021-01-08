import 'package:flutter/material.dart';
import 'package:supply/page/store/widget/store_order_pay_view.dart';
import 'package:supply/page/store/widget/store_order_shipping_address_view.dart';
import 'package:supply/page/store/widget/store_order_shipping_info_view.dart';
import 'package:supply/tools/pay_tools.dart';
import 'package:supply/widget/bar/base_app_bar.dart';
import 'package:supply/widget/bar/simple_app_bar.dart';

/// 购物车 -> 提交订单
class StoreOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(widget: SimpleAppBar(title: '提交订单')),
      body: Stack(
        children: [
          // 订单信息
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                // 收货地址
                SliverToBoxAdapter(child: StoreOrderShippingAddressView()),
                // 订单信息
                SliverToBoxAdapter(child: StoreOrderShippingInfoView()),
                // 支付方式
                SliverToBoxAdapter(child: StoreOrderPayView()),
                //
                SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          ),
          // 提交订单
          Positioned(
            child: Container(
              child: Row(
                children: [
                  Text(
                    '¥18.88',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      var appId = '2021002121602893';
                      var timestamp = '2021-01-06';
                      PayTools.payByAli('app_id=$appId&biz_content=%7B%22timeout_express%22%3A%2230m%22%2C%22seller_id%22%3A%22%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22total_amount%22%3A%220.02%22%2C%22subject%22%3A%221%22%2C%22body%22%3A%22%E6%88%91%E6%98%AF%E6%B5%8B%E8%AF%95%E6%95%B0%E6%8D%AE%22%2C%22out_trade_no%22%3A%22314VYGIAGG7ZOYY%22%7D&charset=utf-8&method=alipay.trade.app.pay&sign_type=RSA2&timestamp=$timestamp%2012%3A12%3A15&version=1.0&sign=MsbylYkCzlfYLy9PeRwUUIg9nZPeN9SfXPNavUCroGKR5Kqvx0nEnd3eRmKxJuthNUx4ERCXe552EV9PfwexqW%2B1wbKOdYtDIb4%2B7PL3Pc94RZL0zKaWcaY3tSL89%2FuAVUsQuFqEJdhIukuKygrXucvejOUgTCfoUdwTi7z%2BZzQ%3D');
                    },
                    child: Text(
                      '结算',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 10),
            ),
            left: 0,
            right: 0,
            bottom: 0,
          ),
        ],
      ),
    );
  }
}