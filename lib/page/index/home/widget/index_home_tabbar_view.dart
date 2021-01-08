import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supply/bloc/home_list_bloc.dart';
import 'package:supply/config/base_config.dart';
import 'package:supply/tools/image_load_tools.dart';

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
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<HomeListBloc, int>(
      builder: (_, value) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (_, index) {
            return GestureDetector(
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: ImageLoadTools.load(
                        '${BaseConfig.host}home/image/milk.webp',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: Text(
                        '光明莫斯利安酸奶原味200g*12盒/24盒巴氏杀菌热处理风味酸牛奶',
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
              onTap: () => Navigator.pushNamed(context, 'store'),
            );
          },
          itemCount: 100,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
