import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supply/tools/location_tools.dart';

/// 首页 -> 收货地址
class IndexHomeAddressView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexHomeAddressViewState();
  }
}

class _IndexHomeAddressViewState extends State<IndexHomeAddressView> {
  LocationTools _tools;
  StreamController<Map<String, Object>> _controller;

  @override
  void initState() {
    super.initState();
    _tools = LocationTools();
    _tools.initialize();
    _tools.start();
    _controller = StreamController();
  }

  @override
  void dispose() {
    _tools.stop();
    _controller.close();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.5),
            child: Icon(Icons.my_location),
          ),
          Expanded(
            child: StreamBuilder<Map<String, Object>>(
              builder: (_, snapshot) {
                var data = snapshot.data;
                print('data = $data');
                return Text(
                  data.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              },
              stream: _controller.stream,
              initialData: {'key': 'value'},
            ),
          ),
        ],
      ),
      onTap: () async {
        var result = await Navigator.pushNamed(context, 'location');
        print('result = $result');
        // if (result != null && result.isNotEmpty) {
        //   _controller.sink.add(result);
        // }
      },
    );
  }
}
