import 'package:flutter/material.dart';
import 'package:supply/config/base_config.dart';
import 'package:supply/tools/image_load_tools.dart';

/// 购物车 -> 提交订单 -> 购物信息
class StoreOrderShippingInfoView extends StatelessWidget {
  ///
  Widget _createItemView(int index) {
    return Row(
      children: [
        Container(
          child: ImageLoadTools.load(
            '${BaseConfig.host}home/image/milk.webp',
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.1),
          ),
          width: 80,
          height: 80,
          margin: EdgeInsets.symmetric(vertical: 5),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              Text(
                '光明莫斯利安酸奶原味200g*12盒/24盒巴氏杀菌热处理风味酸牛奶',
                maxLines: 2,
              ),
              Text('x1'),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 商家
          Container(
            child: Text(
              '美宜佳（科兴科学园店SZ025）',
              style: TextStyle(color: Colors.black),
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.1),
              ),
            ),
            padding: EdgeInsets.only(bottom: 10),
          ),
          // 订单列表
          MediaQuery.removePadding(
            context: context,
            child: ListView.separated(
              itemBuilder: (_, index) => _createItemView(index),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (_, index) {
                return Divider(color: Colors.grey, height: 0.1);
              },
              itemCount: 3,
            ),
            removeTop: true,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.1),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
    );
  }
}
