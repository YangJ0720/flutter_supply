import 'package:flutter/material.dart';

/// 购物车 -> 提交订单 -> 收货地址
class StoreOrderShippingAddressView extends StatelessWidget {
  ///
  String _createDeliveryTime() {
    var dateTime = DateTime.now().add(Duration(minutes: 30));
    return '大约\t${dateTime.hour}:${dateTime.minute}\t送达';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '科兴科学园-A4单元',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey, size: 18),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          SizedBox(height: 7.5),
          Row(
            children: [
              Text('张三\t先生'),
              SizedBox(width: 10),
              Text('13866668888'),
            ],
          ),
          SizedBox(height: 7.5),
          Row(
            children: [
              Expanded(
                child: Text(
                  '立即送出',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                _createDeliveryTime(),
                style: TextStyle(color: Colors.orange),
              ),
              Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey, size: 18),
            ],
          ),
        ],
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
