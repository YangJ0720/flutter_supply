import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///
class IndexMineGridSliver extends StatelessWidget {
  final List<_ItemModel> _list = [
    _ItemModel(0, '订单', 'images/mine/ic_calendar.svg'),
    _ItemModel(1, '评价', 'images/mine/ic_review.svg'),
    _ItemModel(2, '收藏', 'images/mine/ic_star.svg'),
    _ItemModel(3, '足迹', 'images/mine/ic_history.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((_, index) {
        var item = _list[index];
        return InkWell(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SvgPicture.asset(
                  item.icon,
                  color: Colors.blue,
                  width: 80,
                  height: 80,
                  semanticsLabel: item.name,
                ),
                Text(item.name),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
            color: Colors.white,
            margin: EdgeInsets.all(5),
          ),
          onTap: () => Navigator.pushNamed(context, 'order'),
        );
      }, childCount: _list.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _list.length,
      ),
    );
  }
}

///
class _ItemModel {
  final int id;
  final String name;
  final String icon;

  _ItemModel(this.id, this.name, this.icon);
}
