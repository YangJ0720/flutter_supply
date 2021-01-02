import 'package:flutter/material.dart';

///
class LocationSearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('深圳'),
          Icon(Icons.keyboard_arrow_down, size: 20),
          Container(
            color: Colors.white,
            width: 0.5,
            height: 30,
            margin: EdgeInsets.only(left: 10),
          ),
          Expanded(
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '小区/写字楼/学校等',
                prefixIcon: Icon(Icons.search),
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[350],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
