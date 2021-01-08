import 'package:flutter/material.dart';

///
class StoreGoodsNumberView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreGoodsNumberViewState();
  }
}

class _StoreGoodsNumberViewState extends State<StoreGoodsNumberView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text('+', style: TextStyle(fontSize: 16)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          width: 25,
          height: 25,
        ),
        SizedBox(
          child: TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
          width: 50,
        ),
        Container(
          alignment: Alignment.center,
          child: Text('-', style: TextStyle(fontSize: 16)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          width: 25,
          height: 25,
        ),
      ],
      mainAxisSize: MainAxisSize.max,
    );
  }
}
