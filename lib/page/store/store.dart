import 'package:flutter/material.dart';
import 'package:supply/page/store/sliver/store_search_sliver.dart';

/// 商铺界面
class Store extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreState();
  }
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(delegate: StoreSearchSliver(), pinned: true),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((_, index) {
              return Card(
                child: Center(child: Text('index = $index')),
              );
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
