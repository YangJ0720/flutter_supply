import 'package:flutter/material.dart';

/// 商铺信息
class StoreInfoView extends StatelessWidget {
  final String name;

  const StoreInfoView(this.name);

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(fontSize: 12);
    return Column(
      children: [
        Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Text('综合评分:', style: style),
            Icon(Icons.star, size: 15),
            Icon(Icons.star, size: 15),
            Icon(Icons.star, size: 15),
            Icon(Icons.star_half, size: 15),
            Icon(Icons.star_border, size: 15),
          ],
        ),
        Text(
          '公告: 商家提供配送服务，商家提供配送服务，商家提供配送服务。重要的事情说三遍',
          style: style,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
