import 'dart:math';

import 'package:flutter/material.dart';

/// 订单 -> 收件码组件
class IndexOrderTakeCodeView extends StatelessWidget {
  /// 生成4位随机数
  String _createRandom(int length) {
    var sb = StringBuffer();
    for (int i = 0; i < length; i++) {
      sb.write(Random().nextInt(10));
    }
    return sb.toString();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: '收件码:'),
          TextSpan(
            text: _createRandom(4),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
