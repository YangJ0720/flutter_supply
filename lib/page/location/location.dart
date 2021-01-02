import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:supply/page/location/widget/location_search_view.dart';
import 'package:supply/widget/bar/base_app_bar.dart';
import 'package:supply/widget/bar/simple_app_bar.dart';

/// 定位
class Location extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocationState();
  }
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(widget: SimpleAppBar(title: '定位')),
      body: CustomScrollView(
        slivers: [
          // 定位搜索框
          SliverToBoxAdapter(child: LocationSearchView()),
          // 当前定位
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Text('当前定位'),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  child: Icon(Icons.my_location, size: 15),
                ),
                Expanded(
                  child: Text(
                    '深圳市南山区科苑路科兴科学园D单元15F',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('重新定位', style: TextStyle(color: Colors.blue)),
                SizedBox(width: 10),
              ],
            ),
          ),
          // 收货地址
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Text('收货地址'),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((_, index) {
              return Container(
                child: Column(
                  children: [
                    Text(
                      '公司地址$index',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('A单元120$index室'),
                    Text(
                      '张三（先生）\t13866668888',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.25),
                  ),
                ),
                height: 80,
                margin: EdgeInsets.symmetric(horizontal: 10),
              );
            }, childCount: 2),
            itemExtent: 80,
          ),
        ],
      ),
    );
  }
}
