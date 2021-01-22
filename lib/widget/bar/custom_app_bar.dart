import 'dart:ui';

import 'package:flutter/material.dart';

///
class CustomAppBar extends StatelessWidget {
  final String title;
  final Color color;
  final Widget child;

  const CustomAppBar(
      {Key key, this.title, this.color = Colors.white, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paddingTop = MediaQueryData.fromWindow(window).padding.top;
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              // 返回按钮
              SizedBox(
                child: FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios_sharp, color: color),
                  shape: CircleBorder(),
                ),
                width: 50,
                height: 50,
              ),
              // 标题
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //
              SizedBox(child: child, width: 50, height: 50),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
      ),
      color: Colors.blue,
      padding: EdgeInsets.only(top: paddingTop),
    );
  }
}
