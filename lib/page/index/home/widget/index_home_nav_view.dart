import 'package:flutter/material.dart';

/// 首页 -> 分类导航组件
class IndexHomeNavView extends StatelessWidget {
  final List<IconData> _list = [
    Icons.photo,
    Icons.star,
    Icons.perm_contact_calendar,
    Icons.ac_unit,
    Icons.map,
    Icons.keyboard,
    Icons.event,
    Icons.account_balance,
    Icons.wrap_text,
    Icons.assessment,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          return IconButton(icon: Icon(_list[index]), onPressed: () {});
        },
        itemCount: _list.length,
        padding: EdgeInsets.all(10),
        physics: NeverScrollableScrollPhysics(),
      ),
      height: 175,
    );
  }
}
