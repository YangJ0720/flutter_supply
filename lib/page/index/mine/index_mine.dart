import 'package:flutter/material.dart';

/// 我的
class IndexMine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexMineState();
  }
}

class _IndexMineState extends State<IndexMine>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: FlatButton(
        onPressed: () {},
        child: Text('Mine'),
        splashColor: Colors.transparent,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
