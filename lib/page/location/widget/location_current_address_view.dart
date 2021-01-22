import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supply/tools/location_tools.dart';

/// 选择收货地址 ->
class LocationCurrentAddressView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocationCurrentAddressViewState();
  }
}

class _LocationCurrentAddressViewState
    extends State<LocationCurrentAddressView> {
  StreamController<String> _controller;

  @override
  void initState() {
    super.initState();
    _controller = StreamController();
  }

  @override
  void dispose() {
    _controller.close();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 5),
          child: Icon(Icons.my_location, size: 15),
        ),
        Expanded(
          child: StreamBuilder<String>(
            builder: (_, snapshot) {
              var data = snapshot.data;
              return InkWell(
                child: Text(
                  'address = $data',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () => Navigator.pop(context, 'address'),
              );
            },
            stream: _controller.stream,
          ),
        ),
        InkWell(
          child: Text('重新定位', style: TextStyle(color: Colors.blue)),
          onTap: () => LocationTools().start(),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
