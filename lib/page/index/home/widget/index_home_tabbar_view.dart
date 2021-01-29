import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supply/config/base_config.dart';
import 'package:supply/page/index/home/model/home_list_model.dart';
import 'package:supply/route/route_navigator.dart';
import 'package:supply/route/route_paths.dart';
import 'package:supply/tools/image_load_tools.dart';
import 'package:supply/tools/network_load_tools.dart';

/// 首页 -> 选项卡
class IndexHomeTabBarView extends StatefulWidget {
  final String text;

  const IndexHomeTabBarView({Key key, this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndexHomeTabBarViewState();
  }
}

class _IndexHomeTabBarViewState extends State<IndexHomeTabBarView>
    with AutomaticKeepAliveClientMixin {
  StreamController<List<Datum>> _controller;

  ///
  Future<void> _loadData() async {
    var url = '${BaseConfig.host}home/home_list.json';
    String response = await NetworkLoadTools.load(url);
    if (response != null && response.isNotEmpty) {
      var model = HomeListModel.fromRawJson(response);
      if (model.code == BaseConfig.CODE_200) {
        _controller.sink.add(model.data);
        return;
      }
    }
    _controller.sink.addError('error');
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
    super.build(context);
    return StreamBuilder<List<Datum>>(
      builder: (_, snapshot) {
        var data = snapshot.data;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (_, index) {
            var item = data[index];
            return GestureDetector(
              child: Card(
                child: Column(
                  children: [
                    Expanded(child: ImageLoadTools.load(item.image)),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: Text(
                        item.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '¥18.88',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        Text('月销180', style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
              onTap: () => pushNamed(context, RoutePaths.STORE_PAGE),
            );
          },
          itemCount: data.length,
        );
      },
      stream: _controller.stream,
      initialData: [],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
