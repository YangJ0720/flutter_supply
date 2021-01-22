import 'package:flutter/material.dart';

///
class GoodsCountView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GoodsCountView();
  }
}

class _GoodsCountView extends State<GoodsCountView> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '1');
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            child: Container(
              alignment: Alignment.center,
              child: Text('-'),
              width: 25,
              height: 25,
            ),
            onTap: () {
              var count = int.parse(_controller.value.text) - 1;
              if (count >= 0) {
                _controller.text = '$count';
              }
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              child: Text('+'),
              width: 25,
              height: 25,
            ),
            onTap: () {
              var count = int.parse(_controller.value.text) + 1;
              if (count <= 100) {
                _controller.text = '$count';
              }
            },
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.1),
      ),
      width: 100,
    );
  }
}
