import 'package:flutter/material.dart';

/// 商铺 -> 选项卡 -> 商家
class StoreTabViewAbout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreTabViewAboutState();
  }
}

class _StoreTabViewAboutState extends State<StoreTabViewAbout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('商家'),
      ),
    );
  }
}
