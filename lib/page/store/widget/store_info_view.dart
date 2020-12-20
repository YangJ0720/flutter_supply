import 'package:flutter/material.dart';

/// 商铺信息
class StoreInfoView extends StatelessWidget {
  final String name;

  const StoreInfoView(this.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Text('综合评分:', style: TextStyle(fontSize: 12)),
            Icon(Icons.star, size: 15),
            Icon(Icons.star, size: 15),
            Icon(Icons.star, size: 15),
            Icon(Icons.star_half, size: 15),
            Icon(Icons.star_border, size: 15),
          ],
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
