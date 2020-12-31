import 'package:flutter/material.dart';

/// 搜索框
class IndexHomeSearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () => Navigator.pushNamed(context, 'location'),
          splashColor: Colors.transparent,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text('搜索商品名称/商铺名称'),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey[200],
            ),
            margin: EdgeInsets.symmetric(vertical: 7.5),
          ),
        ),
        IconButton(icon: Icon(Icons.sms_rounded), onPressed: () {}),
      ],
    );
  }
}
