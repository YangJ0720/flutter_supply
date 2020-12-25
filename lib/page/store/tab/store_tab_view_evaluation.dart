import 'package:flutter/material.dart';

/// 商铺 -> 选项卡 -> 评价
class StoreTabViewEvaluation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreTabViewEvaluationState();
  }
}

class _StoreTabViewEvaluationState extends State<StoreTabViewEvaluation> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return Card(child: Center(child: Text('评价 -> index = $index')));
      },
      itemCount: 100,
      itemExtent: 150,
    );
  }
}
