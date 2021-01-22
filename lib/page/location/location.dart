import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bmflocation/bdmap_location_flutter_plugin.dart';
import 'package:flutter_bmflocation/flutter_baidu_location_android_option.dart';
import 'package:flutter_bmflocation/flutter_baidu_location_ios_option.dart';
import 'package:supply/page/location/widget/location_list_address_view.dart';
import 'package:supply/page/location/widget/location_search_view.dart';
import 'package:supply/tools/location_tools.dart';
import 'package:supply/widget/bar/base_app_bar.dart';
import 'package:supply/widget/bar/custom_app_bar.dart';
import 'package:supply/widget/bar/simple_app_bar.dart';

import 'widget/location_current_address_view.dart';

/// 定位
class Location extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocationState();
  }
}

class _LocationState extends State<Location> {
  @override
  void initState() {
    super.initState();
    // 开始定位
    // LocationTools().start();
  }

  @override
  void dispose() {
    // 结束定位
    // LocationTools().stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(widget: SimpleAppBar(title: '选择收货地址')),
      body: CustomScrollView(
        slivers: [
          // 定位搜索框
          SliverToBoxAdapter(child: LocationSearchView()),
          // 当前定位
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 20, bottom: 10),
              child: Text('当前定位'),
            ),
          ),
          SliverToBoxAdapter(child: LocationCurrentAddressView()),
          // 收货地址
          SliverToBoxAdapter(
            child: Container(
              child: Row(
                children: [
                  Expanded(child: Text('收货地址')),
                  InkWell(
                    child: Text(
                      '新增地址',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () => Navigator.pushNamed(context, 'location_edit'),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 0.1)),
              ),
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            ),
          ),
          // 收货地址列表
          LocationListAddressView(),
        ],
      ),
    );
  }
}
