import 'package:flutter/material.dart';
import 'package:supply/tools/image_load_tools.dart';

import 'goods_count_view.dart';

///
class GoodsListItemView extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback callback;

  const GoodsListItemView({Key key, this.image, this.name, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: ImageLoadTools.load(image),
            width: 140,
            height: 140,
            margin: EdgeInsets.only(right: 10),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(name),
                    InkWell(
                      child: Icon(Icons.delete),
                      onTap: () => callback.call(),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: [GoodsCountView(), Text('¥18.8')],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
        ],
      ),
      height: 140,
      padding: EdgeInsets.all(10),
    );
  }
}
