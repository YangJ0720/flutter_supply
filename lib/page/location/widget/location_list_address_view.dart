import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supply/page/location/model/location_model.dart';

///
class LocationListAddressView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocationListAddressViewState();
  }
}

class _LocationListAddressViewState extends State<LocationListAddressView> {
  StreamController<List<LocationModel>> _controller;

  ///
  Widget _createItemView(LocationModel model) {
    return Container(
      child: InkWell(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    model.tag,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(model.address),
                  Text(
                    '${model.name}（先生）\t${model.phone}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            InkWell(
              child: Icon(Icons.edit),
              onTap: () {
                Navigator.pushNamed(context, 'location_edit', arguments: model);
              },
            ),
          ],
        ),
        onTap: () => Navigator.pop(context, model.address),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.1),
        ),
      ),
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10),
    );
  }

  ///
  Future<void> _loadData() async {
    final String tag = '科兴科学园';
    final String address = '深圳市南山区科苑路科兴科学园D1单元';
    var list = List.generate(2, (index) {
      return LocationModel(tag, address, '张三', '138${index}666${index}888');
    });
    _controller.sink.add(list);
  }

  @override
  void initState() {
    super.initState();
    _controller = StreamController();
    _loadData();
  }

  @override
  void dispose() {
    _controller.close();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LocationModel>>(
      builder: (_, snapshot) {
        var list = snapshot.data;
        return SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => _createItemView(list[index]),
            childCount: list.length,
          ),
          itemExtent: 80,
        );
      },
      stream: _controller.stream,
      initialData: [],
    );
  }
}
