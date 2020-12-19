import 'package:flutter/material.dart';

/// 首页 -> 选项卡
class IndexHomeTabBarView extends StatefulWidget {
  final String text;

  const IndexHomeTabBarView({Key key, this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndexHomeTabBarViewState();
  }
}

class _IndexHomeTabBarViewState extends State<IndexHomeTabBarView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (_, index) {
        return Card(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              child: Text('${widget.text} -> index = $index'),
            ),
            onTap: () => Navigator.pushNamed(context, 'store'),
          ),
        );
      },
      itemCount: 100,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
