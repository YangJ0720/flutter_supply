import 'package:flutter/material.dart';
import 'package:supply/tools/image_load_tools.dart';

/// banner轮播组件
class BannerView extends StatefulWidget {
  final List<String> list;
  final double height;

  const BannerView(this.list, {this.height = 120});

  @override
  State<StatefulWidget> createState() {
    return _BannerViewState();
  }
}

class _BannerViewState extends State<BannerView> {
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PageView.builder(
        controller: _controller,
        itemBuilder: (_, index) => ImageLoadTools.load(widget.list[index]),
        itemCount: widget.list.length,
      ),
      height: widget.height,
    );
  }
}
