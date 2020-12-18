import 'package:flutter/material.dart';

///
class GuideOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            child: Text('A', style: TextStyle(color: Colors.yellow)),
            color: Colors.blue[200],
            width: 200,
            height: 200,
          ),
        ),
        onTap: () => Navigator.pop(context),
      ),
      backgroundColor: Color(0x90000000),
    );
  }
}
